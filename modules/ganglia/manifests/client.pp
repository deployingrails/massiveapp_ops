class ganglia::client {

  package {
    "ganglia-monitor":
      ensure  => installed
  }

  file {
    "/etc/ganglia/gmond.conf":
      source  => "puppet:///modules/ganglia/gmond.conf",
      owner   => root,
      group   => root,
      mode    => 644,
      notify  => Service["ganglia-monitor"],
      require => Package["ganglia-monitor"];
  }

  service {
    "ganglia-monitor":
      hasrestart => true
  }
}
