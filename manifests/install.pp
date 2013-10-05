# == Class: crashdump::install
#
# Installs linux-crashdump
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
class crashdump::install {

  include crashdump::params

  package { $crashdump::params::package_name:
    ensure => $crashdump::params::package_ensure,
  }

}
