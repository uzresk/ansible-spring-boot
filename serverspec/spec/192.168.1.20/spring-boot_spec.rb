require 'spec_helper'

describe user('cmp') do
  it { should exist }
  it { should belong_to_group 'cmp' }
  it { should have_uid 501 }
end

describe file('/home/cmp/app/service.sh') do
  it { should be_file }
end

describe file('/home/cmp/app/logback.xml') do
  it { should be_file }
end
