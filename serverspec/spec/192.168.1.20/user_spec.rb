require 'spec_helper'

describe user('cmp') do
  it { should exist }
  it { should belong_to_group 'cmp' }
  it { should have_uid 501 }
end
