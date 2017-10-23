################################################################################
# Private                                                                      #
################################################################################

# Edit ~/.bash_profile in Atom and source afterwards.
alias bashedit='${EDITOR} ~/.bash_profile; source ~/.bash_profile'
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
export ANT_HOME='/opt/Ant/apache-ant-1.9.6'
export EDITOR='atom'
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.8.0_144.jdk/Contents/Home'
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'

export PATH=\
${PATH}/bin:\
${ANT_HOME}/bin:\
${EDITOR}:\
${JAVA_HOME}/bin:\
${M2_HOME}/bin:\
${PYTHON_HOME}

# Fully update/upgrade brew.
function brewup() {
    echo "Updating brew ..."
    brew update
    echo "Upgrading brew ..."
    brew upgrade
    echo "Upgrading casks ..."
    brew cask list | xargs brew cask reinstall
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


################################################################################
# ReTest                                                                       #
################################################################################

# Home variables.
export JAVA_1_6_HOME='/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
export RETEST_HOME='/opt/retest'
export RETEST_NIGHTLY_LATEST='/opt/retest/retest-demo-nightly-latest'
export RETEST_STABLE_LATEST='/opt/retest/retest-demo-stable-latest'
export VAGRANT_SERVER_URL="http://192.168.178.51/boxes"

export PATH=\
${PATH}/bin:\
${JAVA_1_6_HOME}/bin:\
${RETEST_HOME}:\
${RETEST_NIGHTLY_LATEST}:\
${RETEST_STABLE_LATEST}:\
${VAGRANT_SERVER_URL}

# Quick start.
function rt() {
    if [ $1 == "nightly" ]
    then
        echo "Launching ReTest version:" $(cat ${RETEST_NIGHTLY_LATEST}/retest/version.txt) "..."
        sh ${RETEST_NIGHTLY_LATEST}/retest/retest-gui.sh
    elif [ $1 == "stable" ]
    then
        echo "Launching ReTest version:" $(cat ${RETEST_STABLE_LATEST}/retest/version.txt) "..."
        sh ${RETEST_STABLE_LATEST}/retest/retest-gui.sh
    else
        echo "Unknow parameter '$1'."
    fi
}

# Fast builds.
function rtinstall() {
    if [ $1 == "O1" ]
    then
        echo "Executing clean install without tests, Proguard, and license download."
        mvn clean install -DskipTests -Dproguard.skip=true -Dlicense.skipDownloadLicenses=true
    elif [ $1 == "O2" ]
    then
        echo "Executing offline install without tests, Proguard, license download, and no info logs."
        mvn -o install -DskipTests -Dproguard.skip=true -Dlicense.skipDownloadLicenses=true | grep -v "^\[INFO"
    else
        echo "Unknow parameter '$1'."
    fi
}

# Update ReTest installations.
function rtup() {
    read -s -p "username:password? " CREDENTIALS
    cd ${RETEST_HOME}

    echo "Updating nightly ..."
    curl --remote-name --user $CREDENTIALS https://retest.de/update/retest-demo-nightly-latest.zip
    rm -rf ${RETEST_NIGHTLY_LATEST}/*
    unzip -o -q retest-demo-nightly-latest.zip -d ${RETEST_NIGHTLY_LATEST}
    rm retest-demo-nightly-latest.zip

    echo "Updating stable ..."
    curl --remote-name --user $CREDENTIALS https://retest.de/update/retest-demo-stable-latest.zip
    rm -rf ${RETEST_STABLE_LATEST}/*
    unzip -o -q retest-demo-stable-latest.zip -d ${RETEST_STABLE_LATEST}
    rm retest-demo-stable-latest.zip

    cd -
}
