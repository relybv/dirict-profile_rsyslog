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

  class { 'rsyslog::server':
    enable_tcp                => true,
    enable_udp                => true,
    enable_relp               => false,
    enable_onefile            => false,
    server_dir                => '/srv/log/',
    custom_config             => undef,
    port                      => '514',
    address                   => '*',
    high_precision_timestamps => false,
    log_templates             => false,
    actionfiletemplate        => false,
    custom_config             => 'rsyslog/server-hostname.conf.erb',
    require                   => File['/srv/log'],
  }

}
