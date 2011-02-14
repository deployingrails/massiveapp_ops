class apache {

  package {
    "apache2":
      ensure => present
  }

  service {
    "apache2":
      ensure      => running,
      hasrestart  => true,
      hasstatus   => true,
      enable      => true,
      require     => Package["apache2"]
  }
}
