################################################################################
# Private                                                                      #
################################################################################

# Edit .bash_profile from dotfiles repo.
alias bashedit='${EDITOR} ~/Dev/Workspaces/dotfiles/runcom/.bash_profile'
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
    brew cask upgrade
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv > /dev/null; then eval "$(jenv init -)"; fi


################################################################################
# retest                                                                       #
################################################################################

# Home variables.
export ANT_HOME='/opt/Ant/apache-ant-1.9.6'
export JAVA_1_6_HOME='/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home'
export RETEST_ROOT_PATH='/opt/retest'
export RETEST_NIGHTLY_LATEST_PATH=${RETEST_ROOT_PATH}'/retest-demo-nightly-latest'
export RETEST_NIGHTLY_LATEST_ZIP='retest-demo-nightly-latest.zip'
export RETEST_BETA_LATEST_PATH=${RETEST_ROOT_PATH}'/retest-demo-beta-latest'
export RETEST_BETA_LATEST_ZIP='retest-demo-beta-latest.zip'
export RETEST_STABLE_LATEST_PATH=${RETEST_ROOT_PATH}'/retest-demo-stable-latest'
export RETEST_STABLE_LATEST_ZIP='retest-demo-stable-latest.zip'
export VAGRANT_SERVER_URL="http://192.168.178.51/boxes"

export PATH=\
${PATH}/bin:\
${ANT_HOME}/bin:\
${JAVA_1_6_HOME}/bin:\
${RETEST_ROOT_PATH}:\
${RETEST_NIGHTLY_LATEST_PATH}:\
${RETEST_NIGHTLY_LATEST_ZIP}:\
${RETEST_BETA_LATEST_PATH}:\
${RETEST_BETA_LATEST_ZIP}:\
${RETEST_STABLE_LATEST_PATH}:\
${RETEST_STABLE_LATEST_ZIP}:\
${VAGRANT_SERVER_URL}

# Quick start.
function rt() {
    if [ $1 == "nightly" ]
    then
        version=${RETEST_NIGHTLY_LATEST_PATH}
    elif [ $1 == "beta" ]
    then
        version=${RETEST_BETA_LATEST_PATH}
    elif [ $1 == "stable" ]
    then
        version=${RETEST_STABLE_LATEST_PATH}
    fi

    echo "Launching retest version:" $(cat ${version}/retest/version.txt) "..."
    sh ${version}/retest/retest-gui.sh
}

# Fast build.
function rtbuild() {
    echo "Executing clean install offline without tests, Proguard, license download, and no info logs ..."
    mvn clean install -o -DskipTests -Dproguard.skip=true -Dlicense.skipDownloadLicenses=true | grep -v "^\[INFO"
}

# Clean retest workspaces.
function rtclean() {
    cd ${RETEST_ROOT_PATH}

    clean() {
        rm -rf $2/*
        unzip -o -q $1 -d $2
    }

    echo "Cleaning nightly ..."
    clean ${RETEST_NIGHTLY_LATEST_ZIP} ${RETEST_NIGHTLY_LATEST_PATH}

    echo "Cleaning beta ..."
    clean ${RETEST_BETA_LATEST_ZIP} ${RETEST_BETA_LATEST_PATH}

    echo "Cleaning stable ..."
    clean ${RETEST_STABLE_LATEST_ZIP} ${RETEST_STABLE_LATEST_PATH}

    cd -
}

# Update retest installations.
function rtup() {
    read -s -p "username:password? " credentials
    cd ${RETEST_ROOT_PATH}

    update() {
        rm $1
        curl --remote-name --user $credentials https://retest.de/update/$1
        rm -rf $2/*
        unzip -o -q $1 -d $2
    }

    echo "Updating nightly ..."
    update ${RETEST_NIGHTLY_LATEST_ZIP} ${RETEST_NIGHTLY_LATEST_PATH}

    echo "Updating beta ..."
    update ${RETEST_BETA_LATEST_ZIP} ${RETEST_BETA_LATEST_PATH}

    echo "Updating stable ..."
    update ${RETEST_STABLE_LATEST_ZIP} ${RETEST_STABLE_LATEST_PATH}

    cd -
}
