class apache2 {

  package {
    "apache2":
      ensure => present
  }

  file {
    "/etc/apache2/sites-enabled/000-default":
      ensure => absent;
    "/etc/apache2/apache2.conf":
      source  => "puppet:///modules/apache2/apache2.conf",
      owner   => root,
      group   => root,
      notify  => Service["apache2"],
      require => Package["apache2"];
    "/etc/logrotate.d/apache2":
      ensure  => absent;
    "/etc/apache2/conf.d/massiveapp.conf":
      source  => "puppet:///modules/apache2/massiveapp.conf",
      owner   => root,
      group   => root,
      notify  => Service["apache2"],
      require => Package["apache2"];
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
