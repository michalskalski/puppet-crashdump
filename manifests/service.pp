# == Class: crashdump::service
#
# ensures thee kdump service is enabled
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
    enable    => $crashdump::params::service_enable,
  }

}
