class nagios {
  package {
    ["nagios3", "apache2"]:
      ensure => present
  }  
}
