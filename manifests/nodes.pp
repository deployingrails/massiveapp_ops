node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "vagrantup" {
  include apache
  include memcached
  include nagios::server
  include ganglia
}
