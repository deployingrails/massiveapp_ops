class ganglia {

  package {
    ["ganglia-monitor", "ganglia-webfrontend","gmetad"]:
      ensure => installed
  }

}
