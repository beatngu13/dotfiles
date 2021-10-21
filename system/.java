#!/usr/bin/env sh

# Use JShell with Java 11.
function jshell() {
    ~/.jenv/versions/11.0/bin/jshell
}

# Use JShell with Java 11 in current Maven project.
function mvn_jshell() {
    java_version_backup="$(jenv version-name)"
    jenv shell 11.0
    mvn jshell:run -DtestClasspath
    jenv shell "${java_version_backup}"
}

# Trigger Maven release.
function mvn_release() {
    release_version="${1}"
    next_version="${2}"
    mvn release:prepare release:perform --batch-mode \
            -Darguments="-DskipTests" \
            -DreleaseVersion="${release_version}" \
            -DdevelopmentVersion="${next_version}"
}

# Show dependency graph for a given package.
# See "includes": https://github.com/ferstl/depgraph-maven-plugin#faq
function mvn_degraph() {
    package="${1}"
    mvn depgraph:aggregate \
            -DcreateImage \
            -DincludeParentProjects \
            -Dincludes="${package}" \
            -DshowVersions
}

# Remove quarantine from GraalVM.
# See "On Software Notarization": https://www.graalvm.org/docs/getting-started/macos/#installation-notes
function graalvm_quarantine() {
    graalvm_dir="{1}"
    jvms_path=/Library/Java/JavaVirtualMachines/

    sudo -v

    mv "${jvms_path}${graalvm_dir}" /tmp/
    xattr -r -d com.apple.quarantine /tmp/"${graalvm_dir}"/Contents/Home
    mv /tmp/"${graalvm_dir}" "${jvms_path}"

    echo 'Do not forget to update GRAALVM_HOME and run jenv add'
}
