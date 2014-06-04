class people::erickreutz (
  $my_username  = $people::erickreutz::params::my_username,
  $my_homedir   = $people::erickreutz::params::my_homedir,
  $my_sourcedir = $people::erickreutz::params::my_sourcedir,
) inherits people::erickreutz::params {
  include people::erickreutz::config
  include people::erickreutz::applications
  include people::erickreutz::osx
}
