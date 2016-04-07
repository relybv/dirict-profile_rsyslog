# == Class profile_rsyslog::install
#
# This class is called from profile_rsyslog for install.
#
class profile_rsyslog::install {

  file { '/srv/log':
    ensure => directory,
    owner  => 'syslog',
    group  => 'syslog',
  }

  class { 'rsyslog::server':
    enable_tcp                => true,
    enable_udp                => false,
    enable_relp               => false,
    enable_onefile            => false,
    server_dir                => '/srv/log/',
    custom_config             => undef,
    port                      => '514',
    address                   => '*',
    high_precision_timestamps => false,
    log_templates             => false,
    actionfiletemplate        => false,
    require                   => File['/srv/log'],
  }

}
