class people::erickreutz::applications {
  include atom
  include autojump
  include iterm2::stable

  $homebrew_packages = [
    'curl',
    'wget',
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

}
