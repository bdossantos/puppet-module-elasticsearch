class elasticsearch::configure {

  File {
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => Package['elasticsearch'],
    notify  => Service['elasticsearch'],
  }

  file { '/etc/elasticsearch/elasticsearch.yml':
    ensure  => 'present',
    content => template('elasticsearch/elasticsearch.yml.erb'),
  }

  file { '/etc/elasticsearch/logging.yml':
    ensure  => 'present',
    content => template('elasticsearch/logging.yml.erb'),
  }
}