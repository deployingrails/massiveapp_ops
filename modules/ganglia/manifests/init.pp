class ganglia {

  package {
    ["ganglia-monitor", "ganglia-webfrontend","gmetad"]:
      ensure  => installed,
      before  => File["/etc/apache2/conf.d/ganglia.conf"]
  }

  file {
    "/etc/ganglia-webfrontend/apache.conf":
      source  => "puppet:///modules/ganglia/apache.conf",
      owner   => root,
      group   => root,
      mode    => 644,
      notify  => Service["apache2"];
    "/etc/apache2/conf.d/ganglia.conf":
      ensure  => link,
      target  => "/etc/ganglia-webfrontend/apache.conf",
      require => File["/etc/ganglia-webfrontend/apache.conf"],
      notify  => Service["apache2"];
    "/etc/ganglia/gmond.conf":
      source  => "puppet:///modules/ganglia/gmond.conf",
      owner   => root,
      group   => root,
      mode    => 644,
      notify  => Service["ganglia-monitor"],
      require => Package["ganglia-monitor"];
    "/etc/ganglia/gmetric":
      ensure  => directory,
      owner   => root,
      group   => root;
    "/etc/ganglia/gmetric/ganglia_mysql_stats.pl":
      source  => "puppet:///modules/ganglia/gmetric/ganglia_mysql_stats.pl",
      owner   => root,
      group   => root,
      mode    => 755,
      require => File["/etc/ganglia/gmetric"]
  }

  cron {
    "ganglia_mysql_stats":
      user    => root,
      minute  => "*",
      command => "/etc/ganglia/gmetric/ganglia_mysql_stats.pl",
      require => File["/etc/ganglia/gmetric/ganglia_mysql_stats.pl"]
  }

  service {
    "ganglia-monitor":
      hasrestart => true
  }

}
