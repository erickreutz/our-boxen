class projects::modnotebooks {

  boxen::project { 'modnotebooks':
    ruby        => '2.0.0',
    postgresql  => true,
    dotenv      => true,
    redis       => true,
    nginx       => true,
    source      => 'git@bitbucket.org:erickreutz/mod-web.git'
  }
}
