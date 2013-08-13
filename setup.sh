#!/bin/bash
# created 17-07-2013
# notes: defaults read -g to see all global settings

echo "protagonist setting up machine as new..."

# disable menu bar transparency
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

# set to graphite
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

# hide menu items
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

# expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# sidebar icon size
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

# check for software updates daily
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# set user switching menu as icon
defaults write NSGlobalDomain userMenuExtraStyle -int 2

# enable subpixel font
defaults write NSGlobalDomain AppleFontSmoothing -int 2

# enable window re-open
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

## KEYBOARD
# speed up keyboard repeat rate
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 25

## MOUSE AND TRACKPAD
# speed up mouse
defaults write -g com.apple.mouse.scaling 1

# enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# three finger drag enable
defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerDragGesture -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true

# disable some irritating gestures
defaults -currentHost write NSGlobalDomain com.apple.trackpad.fourFingerVertSwipeGesture -int 0
defaults -currentHost write -g com.apple.trackpad.fourFingerVertSwipeGesture 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerVertSwipeGesture -int 0

defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerVertSwipeGesture -int 0
defaults -currentHost write -g com.apple.trackpad.threeFingerVertSwipeGesture 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerVertSwipeGesture -int 0

defaults write com.apple.dock showDesktopGestureEnabled -bool false
defaults write com.apple.dock showMissionControlGestureEnabled -bool false
defaults write com.apple.dock showLaunchpadGestureEnabled -bool false

## FINDER
# finder default view to columns
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# finder extensions show
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# finder full path
defaults write com.apple.finder ShowPathbar -bool true

# finder status bar
defaults write com.apple.finder ShowStatusBar -bool true

# finder change warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# finder search location
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# finder show library
chflags nohidden ~/Library

# finder no external disks on desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

# finder no cd/dvd/ipod on desktop
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

# finder window default shows
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://localhost/Users/ben/"

# trash
defaults write com.apple.finder WarnOnEmptyTrash -bool false

## DOCK
# dock positioning
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock pinning -string End
defaults write com.apple.dock orientation -string "right"

# dock minimisation
defaults write com.apple.dock mineffect -string "scale"

# dock lights
defaults write com.apple.dock show-process-indicators -bool true

# dock speed and hide
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide -bool true

# dock hidden translucence
defaults write com.apple.dock showhidden -bool true

# clean out the dock of persistent apps
defaults delete com.apple.dock persistent-other
defaults delete com.apple.dock persistent-apps

## APPLICATIONS
# textedit plaintext
defaults write com.apple.TextEdit RichText -int 0

# safari settings
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari DownloadsClearingPolicy -int 2
defaults write com.apple.Safari NewTabBehavior -int 1
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari HomePage -string ""
defaults write com.apple.Safari NewWindowBehavior -int 1
defaults write com.apple.Safari NewWindowTab -int 1
defaults write com.apple.Safari TabCreationPolicy -int 2
defaults write com.apple.Safari InstallExtensionUpdatesAutomatically -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool YES

# terminal (remember you need to close the initial window to get the new settings)
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
defaults write com.apple.Terminal useOptionAsMetaKey -bool true

# this sets the Pro theme to use option as meta
/usr/libexec/PlistBuddy -c "set :Window\ Settings:Pro:useOptionAsMetaKey true" ~/Library/Preferences/com.apple.Terminal.plist
# /usr/libexec/PlistBuddy -c "print :Window\ Settings:Pro:useOptionAsMetaKey" ~/Library/Preferences/com.apple.Terminal.plist

## EXTRAS
# no ds on networks
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# no timemachine nagging
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

# enable airdrop
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

## RESTART THINGS
for app in "Dock" "Finder" "SystemUIServer" "Terminal" "Safari"; do
	killall "$app" > /dev/null 2>&1
done
killall Dock

echo "---"
echo "We now have normality. Anything you still can't cope with is therefore your own problem."
echo "You might want to reboot now."