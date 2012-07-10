class elasticsearch(
  $version  = '0.19.8',
  $cwd = '/usr/local/src'
) {
  
  $download = "https://github.com/downloads/elasticsearch/elasticsearch/elasticsearch-${elasticsearch::version}.deb"
  
  include elasticsearch::install, 
          elasticsearch::configure, 
          elasticsearch::service
}