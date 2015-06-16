require 'spec_helper'

describe file('/home/cmp/cmp/service.sh') do
  it { should be_file }
end

describe file('/home/cmp/cmp/logback.xml') do
  it { should be_file }
end
