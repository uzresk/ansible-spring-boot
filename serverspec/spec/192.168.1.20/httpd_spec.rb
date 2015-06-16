require 'spec_helper'

describe package('httpd'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('httpd') do
  it { should be_running }
  it { should be_enabled.with_level(3) }
end

describe port(80) do
  it { should be_listening }
end

describe file('/var/log/cmp') do
  it { should be_directory }
end

describe file('/etc/httpd/conf/httpd.conf') do
  it { should contain('/var/log/cmp/error_log').after(/^ErrorLog/) }
  it { should contain('/var/log/cmp/access_log').after(/^CustomLog/) }
end

describe file('/etc/httpd/conf.d/httpd-proxy.conf') do
  it { should contain('/app http://localhost:8080/app').after(/^ProxyPass/) }
  it { should contain('/app http://localhost:8080/app').after(/^ProxyPassReverse/) }
end
