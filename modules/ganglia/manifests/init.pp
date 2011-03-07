class ganglia {

  package {
    ["ganglia-monitor", "ganglia-webfrontend","gmetad"]:
      ensure  => installed,
      before  => File["/etc/apache2/conf.d/ganglia.conf"]
  }

  file {
    "/etc/apache2/conf.d/ganglia.conf":
      ensure  => link,
      target  => "/etc/ganglia-webfrontend/apache.conf",
      notify  => Service["apache2"]
  }

}
