class memcached {
  package {
    ["memcached"]:
      ensure => installed
  }

  service {
    ["memcached"]:
      ensure      => running,
      hasrestart  => true,
      hasstatus   => true,
      enable      => true,
      require     => Package["memcached"]
  }
 
}
