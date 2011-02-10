node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "vagrantup" {
  include memcached
  include nagios::server
}
