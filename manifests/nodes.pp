node "basenode" {
  package {
    ["lsof"]:
      ensure => installed
  }
}

node "vagrant" {
  include nagios
}
