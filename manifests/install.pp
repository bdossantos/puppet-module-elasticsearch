class elasticsearch::install {

  case $::operatingsystem {
    /(?i)(Debian|Ubuntu)/: {
      $java = 'openjdk-6-jre-headless'
    }
    default: {
      fail 'Unsupported OS :('
    }
  }

  package { $java:
    ensure => 'installed',
  }

  exec { 'download-elasticsearch':
    cwd     => '/tmp',
    creates => "/tmp/elasticsearch-${elasticsearch::version}.deb",
    command => "/usr/bin/wget -q ${elasticsearch::download} -O elasticsearch-${elasticsearch::version}.deb",
    timeout => 120,
  }

  package { 'elasticsearch':
    ensure    => 'installed',
    provider  => 'dpkg',
    source    => "/tmp/elasticsearch-${elasticsearch::version}.deb",
    require   => [Exec['download-elasticsearch'], Package[$java]],
  }

  user { 'elasticsearch':
    ensure      => present,
    home        => '/usr/share/elasticsearch',
    managehome  => false,
    comment     => '',
    shell       => '/bin/false',
  }

  if $elasticsearch::data_path != undef {
    file { $elasticsearch::data_path:
      ensure  => 'directory',
      owner   => 'elasticsearch',
      group   => 'elasticsearch',
      mode    => '0700',
      require => [
        Package['elasticsearch'],
        User['elasticsearch']
      ],
    }
  }
}
