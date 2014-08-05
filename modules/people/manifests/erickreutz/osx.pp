class people::erickreutz::osx {
  # osx settings
  include osx::global::disable_key_press_and_hold
  include osx::global::enable_keyboard_control_access
  include osx::global::expand_print_dialog
  include osx::global::expand_save_dialog
  include osx::global::disable_remote_control_ir_receiver
  include osx::dock::2d
  include osx::dock::dim_hidden_apps
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::enable_quicklook_text_selection
  include osx::universal_access::ctrl_mod_zoom
  include osx::disable_app_quarantine
  include osx::universal_access::enable_scrollwheel_zoom
  include osx::no_network_dsstores
  include osx::software_update
  
  class { 'osx::dock::position':
    position => 'left'
  }
  
  class { 'osx::dock::hot_corners':
    top_left => "Start Screen Saver",
    bottom_right => "Desktop"
  }
  
  class { 'osx::sound::interface_sound_effects':
    enable => false
  }
  
  exec { "Disable the sound effects on boot":
    command => 'sudo nvram SystemAudioVolume=" "',
    user => root
  }

  exec { "Menu bar: show remaining battery percentage":
    command => 'defaults write com.apple.menuextra.battery ShowPercent -string "YES"'
  }

  exec { "Menu bar: hide remaining battery time":
    command => 'defaults write com.apple.menuextra.battery ShowTime -string "NO"'
  }

  # Set computer name (as done via System Preferences → Sharing)

  exec { "Set computer name (as done via System Preferences → Sharing)":
    command => 'sudo scutil --set ComputerName "ericsmbp.local" \
              && sudo scutil --set HostName "ericsmbp.local" \
              && sudo scutil --set LocalHostName "ericsmbp.local" \
              && sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "ericsmbp"',
    user => root
  }

  exec { "Set sidebar icon size to medium":
    command => 'defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2'
  }

  exec { "Increase window resize speed for Cocoa applications":
    command => 'defaults write NSGlobalDomain NSWindowResizeTime -float 0.001'
  }

  exec { "Save to disk (not to iCloud) by default":
    command => 'defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false'
  }

  exec { "Automatically quit printer app once the print jobs complete":
    command => 'defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true'
  }

  exec { "Disable Resume system-wide":
    command => "defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false"
  }

  exec { "Disable automatic termination of inactive apps":
    command => "defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true"
  }

  exec { "Disable the crash reporter":
    command => 'defaults write com.apple.CrashReporter DialogType -string "none"'
  }

  exec { "Restart automatically if the computer freezes":
    command => "systemsetup -setrestartfreeze on"
  }

  exec { "Never go into computer sleep mode":
    command => "systemsetup -setcomputersleep Off > /dev/null"
  }

  exec { "Trackpad: enable tap to click for this user and for the login screen":
    command => "defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true \
                && defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1 \
                && defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1"
  }

  exec { "Set a blazingly fast keyboard repeat rate":
    command => "defaults write NSGlobalDomain KeyRepeat -int 0"
  }

  exec { "Automatically illuminate built-in MacBook keyboard in low light":
    command => "defaults write com.apple.BezelServices kDim -bool true"
  }

  exec { "Turn off keyboard illumination when computer is not used for 5 minutes":
    command => "defaults write com.apple.BezelServices kDimTime -int 300"
  }

  exec { "Require password immediately after sleep or screen saver begins":
    command => "defaults write com.apple.screensaver askForPassword -int 1 \
                && defaults write com.apple.screensaver askForPasswordDelay -int 0"
  }

  exec { "Save screenshots to the desktop":
    command => 'defaults write com.apple.screencapture location -string "${HOME}/Desktop"'
  }

  exec { "Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)":
    command => 'defaults write com.apple.screencapture type -string "png"'
  }

  exec { "Disable shadow in screenshots":
    command => "defaults write com.apple.screencapture disable-shadow -bool true"
  }

  exec { "Finder: allow quitting via ⌘ + Q; doing so will also hide desktop icons":
    command => "defaults write com.apple.finder QuitMenuItem -bool true"
  }

  exec { "Finder: disable window animations and Get Info animations":
    command => "defaults write com.apple.finder DisableAllAnimations -bool true"
  }

  exec { "Finder: show hidden files by default":
    command => "defaults write com.apple.finder AppleShowAllFiles -bool true"
  }

  exec { "Finder: show all filename extensions":
    command => "defaults write NSGlobalDomain AppleShowAllExtensions -bool true"
  }

  exec { "Finder: show status bar":
    command => "defaults write com.apple.finder ShowStatusBar -bool true"
  }

  exec { "Finder: show path bar":
    command => "defaults write com.apple.finder ShowPathbar -bool true"
  }

  exec { "Finder: allow text selection in Quick Look":
    command => "defaults write com.apple.finder QLEnableTextSelection -bool true"
  }
  
  exec { "Display full POSIX path as Finder window title":
    command => "defaults write com.apple.finder _FXShowPosixPathInTitle -bool true"
  }

  exec { "When performing a search, search the current folder by default":
    command => 'defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"'
  }
  
  exec { "Disable the warning when changing a file extension":
    command => "defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false"
  }
  
  exec { "Enable spring loading for directories":
    command => "defaults write NSGlobalDomain com.apple.springing.enabled -bool true"
  }
  
  exec { "Disable disk image verification":
    command => "defaults write com.apple.frameworks.diskimages skip-verify -bool true && defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true && defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true"
  }
  
  exec { "Automatically open a new Finder window when a volume is mounted":
    command => "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true"
  }
  
  exec { "Disable Dashboard":
    command => "defaults write com.apple.dashboard mcx-disabled -bool true"
  }
  
  exec { "Don’t show Dashboard as a Space":
    command => "defaults write com.apple.dock dashboard-in-overlay -bool true"
  }
  
  exec { "Make Dock icons of hidden applications translucent":
    command => "defaults write com.apple.dock showhidden -bool true"
  }

  # exec { "Add a spacer to the left side of the Dock (where the applications are)":
  #   command => 'defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}''
  # }
  
  # exec { "Add a spacer to the left side of the Dock (where the applications are)":
  #   command => 'defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}''
  # }
  
  # exec { "Add a spacer to the left side of the Dock (where the applications are)":
  #   command => 'defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}''
  # }
  
  # exec { "Add a spacer to the left side of the Dock (where the applications are)":
  #   command => 'defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}''
  # }
  
  exec { "Hide Spotlight tray-icon (and subsequent helper)":
    command => "sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search"
  }
  
  exec { "Prevent Time Machine from prompting to use new hard drives as backup volume":
    command => "defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true"
  }

  exec { "Disable local Time Machine backups":
    command => "hash tmutil &> /dev/null && sudo tmutil disablelocal"
  }
  
}
