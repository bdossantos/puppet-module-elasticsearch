class elasticsearch::service {

  service { 'elasticsearch':
    ensure      => 'running',
    hasstatus   => true,
    hasrestart  => true,
    enable      => true,
    require     => Class['elasticsearch::install'];
  }
}