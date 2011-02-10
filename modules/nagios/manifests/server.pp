class nagios::server {
  package {
    ["nagios3","nagios3-cgi","nagios3-common","nagios3-core","nagios3-doc","apache2"]:
      ensure => present
  }

  file {
    "/etc/nagios3":
      ensure  => directory,
      owner   => root,
      group   => root,
      mode    => 755,
      require => Package["nagios3"];
    "/etc/nagios3/apache2.conf":
      source  => "puppet:///modules/nagios/apache2.conf",
      owner   => root,
      group   => root,
      mode    => 644,
      require => [Package["apache2"],Package["nagios3"]]
  }

  service {
    "nagios3":
      ensure      => running,
      hasrestart  => true,
      enable      => true,
      hasstatus   => true,
      subscribe   => File["/etc/nagios3"]
  }
}

