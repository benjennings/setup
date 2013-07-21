#!/bin/bash
# created 17-07-2013
# notes: defaults read -g to see all global settings

echo "protagonist setting up machine as new..."

echo "disable menu bar transparency"
defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

echo "set to graphite"
defaults write NSGlobalDomain AppleAquaColorVariant -int 6

echo "hide menu items"
defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"

echo "expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo "increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.2
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo "sidebar icon size"
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1

echo "check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

echo "set user switching menu as icon"
defaults write NSGlobalDomain userMenuExtraStyle -int 2

echo "enable subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

echo "enable window re-open"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true

# KEYBOARD
echo "speed up keyboard repeat rate"
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 25

# MOUSE
echo "fast mouse"
defaults write -g com.apple.mouse.scaling 1

# FINDER
echo "finder default view to columns"
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

echo "finder extensions show"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

echo "finder full path"
defaults write com.apple.finder ShowPathbar -bool true

echo "finder status bar"
defaults write com.apple.finder ShowStatusBar -bool false

echo "finder change warning"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo "finder show library"
chflags nohidden ~/Library

echo "finder no external disks on desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false

echo "finder no cd/dvd/ipod on desktop"
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false

echo "finder window default shows"
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://localhost/Users/ben/"

echo "no ds on networks"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

echo "no timemachine nagging"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

echo "enable airdrop"
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# DOCK

echo "dock pinning"
defaults write com.apple.dock pinning -string End
defaults write com.apple.dock tilesize -int 38
defaults write com.apple.dock orientation -string "right"

echo "dock minimisation"
defaults write com.apple.dock mineffect -string "scale"

echo "dock lights"
defaults write com.apple.dock show-process-indicators -bool true

echo "dock speed and hide"
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide -bool true

echo "dock hidden translucence"
defaults write com.apple.dock showhidden -bool true

# APPLICATIONS

echo "textedit plaintext"
defaults write com.apple.TextEdit RichText -int 0

echo "safari settings"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
defaults write com.apple.Safari IncludeDevelopMenu -bool true

defaults write com.apple.Safari DownloadsClearingPolicy -int 2
defaults write com.apple.Safari NewTabBehavior -int 1
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false
defaults write com.apple.Safari HomePage -string ""
defaults write com.apple.Safari NewWindowBehavior -int 1

echo "terminal"
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"
defaults write com.apple.Terminal useOptionAsMetaKey -bool true

echo "---"
echo "We now have normality. Anything you still can't cope with is therefore your own problem."
echo "You might want to reboot now."