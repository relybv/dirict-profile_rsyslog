# == Class profile_rsyslog::install
#
# This class is called from profile_rsyslog for install.
#
class profile_rsyslog::install {
  # prevent direct use of subclass
  if $caller_module_name != $module_name {
    fail("Use of private class ${name} by ${caller_module_name}")
  }

  # install packages
  ensure_packages( $::profile_rsyslog::packages )
  user { 'syslog':
    ensure => present,
  }

  file { '/srv/log':
    ensure  => directory,
    owner   => 'syslog',
    group   => 'syslog',
    require => User[ 'syslog'],
  }

  class { 'rsyslog::server':
    enable_tcp                => true,
    enable_udp                => true,
    enable_relp               => false,
    enable_onefile            => false,
    server_dir                => '/srv/log/',
    port                      => '514',
    address                   => '*',
    high_precision_timestamps => false,
    log_templates             => false,
    actionfiletemplate        => false,
    custom_config             => 'rsyslog/server-hostname.conf.erb',
    require                   => File['/srv/log'],
  }

}
