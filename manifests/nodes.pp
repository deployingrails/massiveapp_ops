node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
  include ssh
}

node "app" inherits basenode {
  include apache2
  include massiveapp
  include memcached
  include mysql
  include passenger
  include ganglia::client
}

node "ganglia" inherits basenode {
  include apache2
  include ganglia::server
}
