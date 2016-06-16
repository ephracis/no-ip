require 'spec_helper'

describe file('/usr/local/bin/noip2') do
  it { should exist }
end

# TODO: this test require a real username and password
# describe file('/usr/local/etc/no-ip2.conf') do
#   it { should exist }
# end

describe service('noip2') do
  # TODO: this test require a real username and password
  # it { should be_running }
  it { should be_enabled }
end
