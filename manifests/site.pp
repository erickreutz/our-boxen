require boxen::environment
require homebrew
require gcc

Exec {
  group       => 'staff',
  logoutput   => on_failure,
  user        => $boxen_user,

  path => [
    "${boxen::config::home}/rbenv/shims",
    "${boxen::config::home}/rbenv/bin",
    "${boxen::config::home}/rbenv/plugins/ruby-build/bin",
    "${boxen::config::homebrewdir}/bin",
    '/usr/bin',
    '/bin',
    '/usr/sbin',
    '/sbin'
  ],

  environment => [
    "HOMEBREW_CACHE=${homebrew::config::cachedir}",
    "HOME=/Users/${::boxen_user}"
  ]
}

File {
  group => 'staff',
  owner => $boxen_user
}

Package {
  provider => homebrew,
  require  => Class['homebrew']
}

Repository {
  provider => git,
  extra    => [
    '--recurse-submodules'
  ],
  require  => File["${boxen::config::bindir}/boxen-git-credential"],
  config   => {
    'credential.helper' => "${boxen::config::bindir}/boxen-git-credential"
  }
}

Service {
  provider => ghlaunchd
}

Homebrew::Formula <| |> -> Package <| |>

node default {
  # core modules, needed for most things
  include git
  include hub
  include sysctl
  include autoconf
  include libtool
  include pkgconfig
  include pcre
  include libpng
  include wget

  # fail if FDE is not enabled
  if $::root_encrypted == 'no' {
    fail('Please enable full disk encryption and try again')
  }

  nodejs::version { 'v0.10': }
  nodejs::version { 'v0.12.4': }
  class { 'nodejs::global': version => 'v0.12.4' }

  nodejs::module { 'bower':
    node_version => 'v0.12.4'
  }

  nodejs::module { 'ember-cli':
    node_version => 'v0.12.4'
  }

  # default ruby versions
  ruby::version { '2.0.0': }
  ruby::version { '2.1.0': }
  ruby::version { '2.1.1': }
  ruby::version { '2.1.2': }
  ruby::version { '2.2.2': }

  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.10.2',
    ruby_version => '*',
  }

  ruby_gem { 'git_remote_branch for all rubies':
    gem          => 'git_remote_branch',
    version      => '0.3.8',
    ruby_version => '*'
  }

  ruby_gem { 'foreman for all rubies':
    gem          => 'foreman',
    version      => '0.78.0',
    ruby_version => '*',
  }

  ruby_gem { 'middleman for all rubies':
    gem          => 'middleman',
    version      => '3.3.13',
    ruby_version => '*',
  }

  # common, useful packages
  package {
    [
      'ack',
      'findutils',
      'gnu-tar',
      'coreutils',
    ]:
  }

  file { "${boxen::config::srcdir}/our-boxen":
    ensure => link,
    target => $boxen::config::repodir
  }
}
