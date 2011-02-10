node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "vagrantup" {
  include nagios
}
