# == Class profile_rsyslog::install
#
# This class is called from profile_rsyslog for install.
#
class profile_rsyslog::install {

  user { 'syslog':
    ensure => present,
  }

  file { '/srv/log':
    ensure  => directory,
    owner   => 'syslog',
    group   => 'syslog',
    require => User[ 'syslog'],
  }

  class { '::rsyslog':
    preserve_fqdn => true,
  }

}
