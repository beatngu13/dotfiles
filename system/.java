#!/usr/bin/env sh

# Use JShell with Java 11 in current Maven project.
function mvn_jshell() {
    mvn jshell:run -DtestClasspath
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
    graalvm_dir="${1}"
    jvms_path=/Library/Java/JavaVirtualMachines/

    sudo xattr -r -d com.apple.quarantine "${jvms_path}${graalvm_dir}"
    jenv add "${jvms_path}${graalvm_dir}"/Contents/Home/

    echo 'Do not forget to update GRAALVM_HOME'
}
