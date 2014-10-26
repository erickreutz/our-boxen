class sizeup {
  package { 'SizeUp':
    source   => 'http://www.irradiatedsoftware.com/download/SizeUp.zip',
    provider => 'compressed_app'
  }
}
