################################################################################
# Private                                                                      #
################################################################################

# Edit ~/.bash_profile in Atom and source afterwards.
alias bashedit='${EDITOR} ~/.bash_profile'
# Port scan: stroke <address> <startPort> <endPort>.
alias stroke='/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Enable and specify terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Home variables.
export EDITOR='atom'
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'

export PATH=\
${PATH}/bin:\
${EDITOR}:\
${M2_HOME}/bin:\
${PYTHON_HOME}

# Fully update/upgrade brew.
function brewup() {
    echo "Updating brew ..."
    brew update
    echo "Upgrading brew ..."
    brew upgrade
    echo "Upgrading casks ..."
    brew cu --all
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


################################################################################
# retest                                                                       #
################################################################################

# Home variables.
export ANT_HOME='/opt/Ant/apache-ant-1.9.6'
export JAVA_1_6_HOME='/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
export RETEST_ROOT='/opt/retest'
export RETEST_NIGHTLY_LATEST=${RETEST_ROOT}'/retest-demo-nightly-latest'
export RETEST_BETA_LATEST=${RETEST_ROOT}'/retest-demo-beta-latest'
export RETEST_STABLE_LATEST=${RETEST_ROOT}'/retest-demo-stable-latest'
export VAGRANT_SERVER_URL="http://192.168.178.51/boxes"

export PATH=\
${PATH}/bin:\
${ANT_HOME}/bin:\
${JAVA_1_6_HOME}/bin:\
${RETEST_ROOT}:\
${RETEST_NIGHTLY_LATEST}:\
${RETEST_BETA_LATEST}:\
${RETEST_STABLE_LATEST}:\
${VAGRANT_SERVER_URL}

# Quick start.
function rt() {
    if [ $1 == "nightly" ]
    then
        VERSION=${RETEST_NIGHTLY_LATEST}
    elif [ $1 == "beta" ]
    then
        VERSION=${RETEST_BETA_LATEST}
    elif [ $1 == "stable" ]
    then
        VERSION=${RETEST_STABLE_LATEST}
    fi

    echo "Launching retest version:" $(cat ${VERSION}/retest/version.txt) "..."
    sh ${VERSION}/retest/retest-gui.sh
}

# Fast build.
function rtbuild() {
    echo "Executing offline install without tests, Proguard, license download, and no info logs ..."
    mvn -o install -DskipTests -Dproguard.skip=true -Dlicense.skipDownloadLicenses=true | grep -v "^\[INFO"
}

# Update retest installations.
function rtup() {
    read -s -p "username:password? " credentials
    cd ${RETEST_ROOT}

    update() {
        curl --remote-name --user $credentials https://retest.de/update/$1
        rm -rf $2/*
        unzip -o -q $1 -d $2
        rm $1
    }

    echo "Updating nightly ..."
    update retest-demo-nightly-latest.zip ${RETEST_NIGHTLY_LATEST}

    echo "Updating beta ..."
    update retest-demo-beta-latest.zip ${RETEST_BETA_LATEST}

    echo "Updating stable ..."
    update retest-demo-stable-latest.zip ${RETEST_STABLE_LATEST}

    cd -
}
