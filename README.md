puppet-module-elasticsearch
===========================

Presentation
------------

Install elasticsearch from `.deb` package.

package is downloaded from [elasticsearch download page](http://www.elasticsearch.org/download/)

Example
-------

``` puppet
class { 'elasticsearch':
  version                   => '0.20.1',
  cwd                       => '/usr/local/src',
  cluster_name              => 'elasticsearch',
  node_master               => true,
  node_data                 => true,
  index_number_of_shards    => 1,
  index_number_of_replicas  => 0,
  bind_host                 => '0.0.0.0',
  data_path                 => '/var/elasticsearch',
}
```

**Note**: To use the data path option, you have to ensure directory is present
