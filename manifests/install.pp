class elasticsearch::install {

  case $operatingsystem {
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
    provider  => 'dpkg',
    ensure    => 'installed',
    source    => "/tmp/elasticsearch-${elasticsearch::version}.deb",
    require   => [Exec['download-elasticsearch'], Package[$java]],
  }
}
