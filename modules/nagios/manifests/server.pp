class nagios::server {

  package {
    ["nagios3","nagios3-cgi","nagios3-common","nagios3-core","nagios3-doc"]:
      ensure => present
  }

  user {
    "www-data":
      groups => "nagios"
  }

  file {
    "/etc/nagios3/conf.d":
      source  => "puppet:///modules/nagios/conf.d/",
      ensure  => directory,
      owner   => nagios,
      group   => nagios,
      mode    => 0644,
      recurse => true,
      notify  => Service["nagios3"],
      require => [Package["apache2"],Package["nagios3"]];
    "/etc/nagios3/apache2.conf":
      source  => "puppet:///modules/nagios/apache2.conf",
      owner   => root,
      group   => root,
      mode    => 644,
      notify  => Service["apache2"],
      require => [Package["apache2"],Package["nagios3"]];
    "/etc/nagios3/htpasswd.users":
      source  => "puppet:///modules/nagios/htpasswd.users",
      owner   => www-data,
      group   => nagios,
      mode    => 640,
      require => [Package["apache2"],Package["nagios3"]];
  }

  service {
    "nagios3":
      ensure      => running,
      hasrestart  => true,
      enable      => true,
      hasstatus   => true,
      restart     => "/etc/init.d/nagios3 reload",
      require     => Package["nagios3"]
  }

}

