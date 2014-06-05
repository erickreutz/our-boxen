class people::erickreutz::applications {
  include atom
  include autojump
  include iterm2::dev
  include sizeup
  include alfred
  include onepassword
  include dropbox
  include rdio
  include slack
  include vlc
  include skype
  include flux::beta
  include mplayerx
  include heroku
  include sequel_pro
  include spotify
  include notational_velocity
  include caffeine
  include googledrive
  include chrome
  include chrome::canary

  $homebrew_packages = [
    'curl',
    'zsh',
    'imagemagick'
  ]

  ## Declare all Homebrew packages at once
  package { $homebrew_packages: }

  package { 'Virtualbox':
    ensure => installed,
    source => 'http://download.virtualbox.org/virtualbox/4.3.12/VirtualBox-4.3.12-93733-OSX.dmg',
    provider => pkgdmg,
  }

  package { 'Transmission':
    source   => 'https://transmission.cachefly.net/Transmission-2.83.dmg',
    provider => appdmg
  }

  heroku::plugin { 'accounts':
    source => 'ddollar/heroku-accounts'
  }

  iterm2::colors { 'Erics Colors':
    ansi_0_color        => [0.0, 0.0, 0.0],
    ansi_1_color        => [0.94901961088180542, 0.46666666865348816, 0.47843137383460999],
    ansi_2_color        => [0.60000002384185791, 0.80000001192092896, 0.60000002384185791],
    ansi_3_color        => [1, 0.80000001192092896, 0.40000000596046448],
    ansi_4_color        => [0.40000000596046448, 0.60000002384185791, 0.80000001192092896],
    ansi_5_color        => [0.80000001192092896, 0.60000002384185791, 0.80000001192092896],
    ansi_6_color        => [0.40000000596046448, 0.80000001192092896, 0.80000001192092896],
    ansi_7_color        => [1, 0.99997437000274658, 0.99999129772186279],
    ansi_8_color        => [0, 0, 0],
    ansi_9_color        => [0.94901961088180542, 0.46666666865348816, 0.47843137383460999],
    ansi_10_color       => [0.60000002384185791, 0.80000001192092896, 0.60000002384185791],
    ansi_11_color       => [1, 0.80000001192092896, 0.40000000596046448],
    ansi_12_color       => [0.40000000596046448, 0.60000002384185791, 0.80000001192092896],
    ansi_13_color       => [0.80000001192092896, 0.60000002384185791, 0.80000001192092896],
    ansi_14_color       => [0.40000000596046448, 0.80000001192092896, 0.80000001192092896],
    ansi_15_color       => [1, 0.99997437000274658, 0.99999129772186279],
    background_color    => [0.050763573497533798, 0.050763573497533798, 0.050763573497533798],
    bold_color          => [0.80000001192092896, 0.80000001192092896, 0.80000001192092896],
    cursor_color        => [0.80000001192092896, 0.80000001192092896, 0.80000001192092896],
    cursor_text_color   => [0.17647059261798859, 0.17647059261798859, 0.17647059261798859],
    foreground_color    => [0.80000001192092896, 0.80000001192092896, 0.80000001192092896],
    selected_text_color => [0.80000001192092896, 0.80000001192092896, 0.80000001192092896],
    selection_color     => [0.31764706969261169, 0.31764706969261169, 0.31764706969261169],
  }

}
