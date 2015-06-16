require 'spec_helper'

describe package('postgresql'), :if => os[:family] == 'redhat' do
  it { should be_installed }
end

describe service('postgresql'), :if => os[:family] == 'redhat' do
  it { should be_enabled }
  it { should be_running }
end

describe port(5432) do
  it { should be_listening }
end

describe file('/var/lib/pgsql/data/pg_hba.conf') do
  it { should contain 'host    all         all         0.0.0.0/0             trust' }
end

describe file('/var/lib/pgsql/data/postgresql.conf') do
  it { should contain 'listen_addresses = \'*\'' }
end
