define elasticsearch::plugin(
  $plugin_bin = '/usr/share/elasticsearch/bin/plugin',
  $username   = '',
  $repo_name  = '',
  $version    = ''
){

  exec { $name:
    command => "${plugin_bin} -install ${username}/${repo_name}/${version}",
    require => Package['elasticsearch'],
  }
}