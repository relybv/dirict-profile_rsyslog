# == Class profile_rsyslog::params
#
# This class is meant to be called from profile_rsyslog.
# It sets variables according to platform.
#
class profile_rsyslog::params {
  $logvol = '/dev/vdb'
  case $::osfamily {
    'Debian': {
      $package_name = 'profile_rsyslog'
      $service_name = 'profile_rsyslog'
    }
    'RedHat', 'Amazon': {
      $package_name = 'profile_rsyslog'
      $service_name = 'profile_rsyslog'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
