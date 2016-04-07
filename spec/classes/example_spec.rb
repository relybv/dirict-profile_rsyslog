require 'spec_helper'

describe 'profile_rsyslog' do
  context 'supported operating systems' do
    on_supported_os.each do |os, facts|
      context "on #{os}" do
        let(:facts) do
          facts.merge({
            :concat_basedir => "/foo"
          })
        end

        context "profile_rsyslog class without any parameters" do
          let(:params) {{ }}

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('profile_rsyslog') }

          it { is_expected.to contain_class('profile_rsyslog::install') }
          it { is_expected.to contain_class('profile_rsyslog::config') }
          it { is_expected.to contain_class('profile_rsyslog::params') }
          it { is_expected.to contain_class('profile_rsyslog::service') }
          it { is_expected.to contain_class('rsyslog') }
          it { is_expected.to contain_class('rsyslog::install') }
          it { is_expected.to contain_class('rsyslog::config') }
          it { is_expected.to contain_class('rsyslog::params') }
          it { is_expected.to contain_class('rsyslog::service') }

          it { is_expected.to contain_file('/srv/log') }

        end
      end
    end
  end
end
