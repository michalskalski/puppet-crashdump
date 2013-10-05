# == Class: crashdump::config
#
# make sure linux crashdump is configured properly
#
# === Parameters
#
# === Examples
#
#  don't use this class on its own.
#
# === Authors
#
# Author Name <puppet@brainsware.org>
#
# === Copyright
#
# Copyright 2013 Brainsware
#
class crashdump::config {

  case $::osfamily {
    'RedHat' : {
      exec { 'update grub config':
        command  => 'grubby --update-kernel=ALL --args="crashkernel=128M"',
        pwd      => '/',
        path     => '/sbin:/bin:/usr/bin:/usr/sbin',
        provider => 'posix',
      }
    }
    'Debian' : {
      case $::operatingsystem {
        # This is a hack. We make sure that on Ubuntu the crashkernel line in
        # /etc/grub.d/10_linux isn't something that will just NOT work, see errata:
        #   https://wiki.ubuntu.com/Kernel/CrashdumpRecipe#Release_specific_notes
        # replace:     GRUB_CMDLINE_EXTRA="$GRUB_CMDLINE_EXTRA crashkernel=384M-2G:64M,2G-:128M"
        'Ubuntu' : {
          file_line { 'crashkernel=128M':
            path  => '/etc/grub.d/10_linux',
            match => '    GRUB_CMDLINE_EXTRA="\$GRUB_CMDLINE_EXTRA crashkernel=.*',
            line  => '    GRUB_CMDLINE_EXTRA="$GRUB_CMDLINE_EXTRA crashkernel=128M"',
          }
        }
        default : {
          # on debian we do something else.
        }
      }
    }
    default : {
      # nothing to do here.
    }
  }


}
