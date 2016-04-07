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

  class { '::profile_rsyslog::install': } ->
  class { '::profile_rsyslog::config': } ~>
  class { '::profile_rsyslog::service': } ->
  Class['::profile_rsyslog']

}
