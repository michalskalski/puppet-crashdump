# == Class: crashdump::params
#
# basic parameters - this is where we do "platform independence"...
#
# === Variables
#
# === Authors
#
# Author Name <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2014 Brainsware
#
class crashdump::params {

  $package_ensure = 'installed'
  $package_name   = $::osfamily? {
    'Debian' => [ 'linux-crashdump', 'kexec-tools' ],
    'RedHat' => [ 'crash', 'kexec-tools' ],
  }

  $service_name   = $::lsbdistcodename? {
    'trusty' => 'kexec-load',
    default  => 'kdump',
  }

  $service_enable =  true
  $service_ensure = 'running'

}
