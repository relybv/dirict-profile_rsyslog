# == Class profile_rsyslog::install
#
# This class is called from profile_rsyslog for install.
#
class profile_rsyslog::install {

  package { $::profile_rsyslog::package_name:
    ensure => present,
  }
}
