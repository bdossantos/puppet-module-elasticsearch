node default {
  include elasticsearch

  elasticsearch::plugin { 'couchdb-river':
    username  => 'elasticsearch',
    repo_name => 'elasticsearch-river-couchdb',
  }
}