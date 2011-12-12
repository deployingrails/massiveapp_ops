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
  include nagios::client
  include ganglia::client
}

node "nagios" inherits basenode {
  include apache2
  include nagios::server
}

node "ganglia" inherits basenode {
  include apache2
  include ganglia::server
}
