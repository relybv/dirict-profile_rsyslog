# == Class profile_rsyslog::service
#
# This class is meant to be called from profile_rsyslog.
# It ensure the service is running.
#
class profile_rsyslog::service {

  service { $::profile_rsyslog::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
