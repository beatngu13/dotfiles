COMPUTER_NAME="beatngu13-hq"

osascript -e 'tell application "System Preferences" to quit'


################################################################################
# General Settings                                                             #
################################################################################

# Set computer name (as done via System Preferences).
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

# Disable sound effects on boot.
sudo nvram SystemAudioVolume=" "

# Show battery percentage in menu bar.
defaults write com.apple.menuextra.battery ShowPercent YES

# Disable "Are you sure you want to open this application?" dialog.
defaults write com.apple.LaunchServices LSQuarantine -bool false

# Disable smart quotes and dashes.
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


################################################################################
# Trackpad, Mouse, and Keyboard                                                #
################################################################################

# Swipe between pages with three fingers.
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1

# Illuminate built-in keyboard in low light.
defaults write com.apple.BezelServices kDim -bool true

# Turn off keyboard illumination when computer is not used for 5 min.
defaults write com.apple.BezelServices kDimTime -int 300


################################################################################
# Screen                                                                       #
################################################################################

# Require password immediately after sleep or screen saver begins.
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

# Save screenshots to the desktop.
defaults write com.apple.screencapture location -string "${HOME}/Desktop"

# Disable shadow in screenshots.
defaults write com.apple.screencapture disable-shadow -bool true


################################################################################
# Finder                                                                       #
################################################################################

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Use current folder by default when performing search.
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable warning when changing a file extension.
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Avoid creating .DS_Store files on network or USB volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Always use list view.
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"


################################################################################
# Dock                                                                         #
################################################################################

# Automatically hide and show.
defaults write com.apple.dock autohide -bool true


################################################################################
# Mail                                                                         #
################################################################################

# Display emails in threaded mode.
defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"

# Copy email addresses as "foo@example.com" instead of "Foo Bar <foo@example.com>".
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

# Disable inline attachments (just show the icons).
defaults write com.apple.mail DisableInlineAttachmentViewing -bool true


################################################################################
# Terminal                                                                     #
################################################################################

# Only use UTF-8.
defaults write com.apple.terminal StringEncodings -array 4

# Use "Pro" theme.
defaults write com.apple.terminal "Default Window Settings" -string "Pro"
defaults write com.apple.terminal "Startup Window Settings" -string "Pro"


################################################################################
# App Store                                                                    #
################################################################################

# Enable automatic update check.
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Check for software updates daily (not just once per week).
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1


################################################################################
# Kill Affected Apps                                                           #
################################################################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "Safari" "SystemUIServer" "iCal"; do
    killall "${app}" &>/dev/null
done
