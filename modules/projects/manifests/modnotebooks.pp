class projects::modnotebooks {

  boxen::project { 'modnotebooks':
    ruby        => '2.1.1',
    postgresql  => true,
    redis       => true,
    nginx       => true,
    source      => 'erickreutz/mod-rails'
  }
}
