# == Class: mplayerx
#
# Installs the latest version of the MPlayerX Mac application
#
# === Authors
#
# Robby Colvin <geetarista@gmail.com>
#
class mplayerx {
  package { 'MPlayerX':
    provider => 'compressed_app',
    source   => 'http://mplayerx.googlecode.com/files/MPlayerX-1.0.21.zip',
  }
}
