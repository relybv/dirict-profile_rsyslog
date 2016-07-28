# == Class profile_rsyslog::config
#
# This class is called from profile_rsyslog for service config.
#
class profile_rsyslog::config {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }
}
