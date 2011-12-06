node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "app" {
  include apache2
  include massiveapp
  include memcached
  include mysql
  include passenger
  include nagios::client
  include ganglia::client
}

node "nagios" {
  include apache2
  include nagios::server
}

node "ganglia" {
  include apache2
  include ganglia::server
}
