node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "vagrantup" {
  include apache
  include ganglia
  include massiveapp
  include memcached
  include nagios::server
}
