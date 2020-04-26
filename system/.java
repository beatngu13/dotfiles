# Use JShell with Java 11.
function jshell() {
    ~/.jenv/versions/11.0/bin/jshell
}

# Use JShell with Java 11 in current Maven project.
function mvnjshell() {
    java_version_backup="$(jenv version-name)"
    jenv shell 11.0
    mvn jshell:run -DtestClasspath
    jenv shell "${java_version_backup}"
}

# Trigger Maven release.
function mvnrelease() {
    release_version="${1}"
    next_version="${2}"
    echo "Trigger release (without tests and GPG) for ${release_version}, next is ${next_version} ..."
    mvn release:prepare release:perform \
            -Darguments="-DskipTests -Dgpg.skip" \
            -DreleaseVersion="${release_version}" \
            -Dtag="v${release_version}" \
            -DdevelopmentVersion="${next_version}"
}

# Show dependency graph for a given package.
# See "includes": https://github.com/ferstl/depgraph-maven-plugin#faq
function mvndegraph() {
    package="${1}"
    mvn depgraph:aggregate \
            -DcreateImage \
            -DincludeParentProjects \
            -Dincludes="${package}" \
            -DshowVersions
}
