# == Class profile_rsyslog::lvm
#
# This class is called from profile_rsyslog for logical volume manager.
#
class profile_rsyslog::lvm {

  class { '::lvm':
    manage_pkg    => true,
  }

  physical_volume { $::profile_rsyslog::logvol:
    ensure  => present,
    require => Class[ '::lvm' ],
  }

  volume_group { 'logvg':
    ensure           => present,
    physical_volumes => $::profile_rsyslog::logvol,
    require          => Physical_volume[  $::profile_rsyslog::logvol ],
  }

  logical_volume { 'loglv':
    ensure       => present,
    volume_group => 'logvg',
    require      => Volume_group[ 'logvg' ],
  }

  filesystem { '/dev/logvg/loglv':
    ensure  => present,
    fs_type => 'ext4',
    atboot  => true,
    require => Logical_volume[ 'loglv' ],
  }

  mount { '/srv/log':
    ensure  => mounted,
    device  => '/dev/logvg/loglv',
    fstype  => 'ext4',
    require => Filesystem[ '/dev/logvg/loglv'],
  }

}
