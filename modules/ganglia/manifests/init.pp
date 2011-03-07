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
  }

}
