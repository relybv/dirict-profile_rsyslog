# == Class: profile_rsyslog
#
# Full description of class profile_rsyslog here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class profile_rsyslog (
) inherits ::profile_rsyslog::params {

  # validate parameters here
  if versioncmp($::facterversion, '2.4.6') > 0 {
    if 'vdb' in $::disks {
      class { '::profile_rsyslog::lvm': }
    }
  }

  class { '::profile_rsyslog::install': }
  -> class { '::profile_rsyslog::config': }
  ~> class { '::profile_rsyslog::service': }
  -> Class['::profile_rsyslog']

}
