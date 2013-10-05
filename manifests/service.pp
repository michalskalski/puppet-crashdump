# == Class: crashdump::service
#
# ensures thee kdump service is running
#
# === Parameters
#
# === Examples
#
#  Don't use this class directly
#
# === Authors
#
# Author Name <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class crashdump::service {

  include crashdump::params

  service { $crashdump::params::service_name:
    ensure => $crashdump::params::service_ensure,
    enable => $crashdump::params::service_enable,
  }

}
