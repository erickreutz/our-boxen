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

  exec { "set computer name":
    command => 'sudo scutil --set ComputerName "ericsmba"',
    user => root
  }

  exec { "set host name":
    command => 'sudo scutil --set HostName "ericsmbp"',
    user => root
  }

  exec { "set local host name":
    command => 'sudo scutil --set LocalHostName "ericsmbp"',
    user => root
  }

  exec { "set samba name":
    command => 'sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "ericsmbp"',
    user => root
  }
}
