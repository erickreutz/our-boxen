class people::erickreutz::config (
  $my_homedir   = $people::erickreutz::params::my_homedir,
  $my_sourcedir = $people::erickreutz::params::my_sourcedir,
  $my_username  = $people::erickreutz::params::my_username
) {

  File {
    owner => $my_username,
    group => 'staff',
    mode  => '0644',
  }

  # Changes the default shell to the zsh version we get from Homebrew
  # Uses the osx_chsh type out of boxen/puppet-osx
  osx_chsh { $::luser:
    shell   => '/opt/boxen/homebrew/bin/zsh',
    require => Package['zsh'],
  }

  file_line { 'add zsh to /etc/shells':
    path    => '/etc/shells',
    line    => "${boxen::config::homebrewdir}/bin/zsh",
    require => Package['zsh'],
  }

  # Dotfiles
  ####################################

  repository { "${my_sourcedir}/oh-my-zsh":
    ensure => 'origin/HEAD',
    source  => 'robbyrussell/oh-my-zsh',
  }

  repository { "${my_sourcedir}/dotfiles":
    ensure => 'origin/HEAD',
    source  => 'erickreutz/dotfiles',
  }

  file { "/Users/${my_username}/.oh-my-zsh":
    ensure  => link,
    target  => "${my_sourcedir}/oh-my-zsh",
    require => Repository["${my_sourcedir}/oh-my-zsh"],
  }

  file { "/Users/${my_username}/.atom":
    ensure  => link,
    target  => "${my_sourcedir}/atom",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.zshrc":
    ensure => link,
    mode   => '0644',
    target => "${my_sourcedir}/dotfiles/zshrc",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.oh-my-zsh/plugins/erickreutz":
    ensure => link,
    mode   => '0644',
    target => "${my_sourcedir}/dotfiles/oh-my-zsh/custom/plugins/erickreutz",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

  file { "/Users/${my_username}/.oh-my-zsh/themes/erickreutz.zsh-theme":
    ensure => link,
    mode   => '0644',
    target => "${my_sourcedir}/dotfiles/oh-my-zsh/custom/erickreutz.zsh-theme",
    require => Repository["${my_sourcedir}/dotfiles"],
  }

}
