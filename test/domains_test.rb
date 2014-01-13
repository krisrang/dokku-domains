require 'test_helper'

describe 'Domains' do
  before do
    TestHelper.cleanup
  end

  it 'lists available commands' do
    TestHelper.call_commands('help').must_equal <<-EOF
    domains <app>                                   display the domains for an app
    domains:set <app> DOMAIN1 [DOMAIN2 ...]         set one or more domains
    EOF
  end

  it 'lists no domains for app without custom domains' do
    TestHelper.call_commands('domains', 'app').strip.must_equal "-----> Domains for app"
  end
end