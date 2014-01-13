require 'bundler'
require 'bundler/setup'

require 'minitest/autorun'
require 'minitest/rg'

class TestHelper
  def self.root
    Pathname.new(File.expand_path(__FILE__+'/../../'))
  end

  def self.dokku_root
    root.join('test/apps')
  end

  def self.call_commands(cmd, *args)
    cmd = "#{root.join("commands")} #{cmd} #{args.join(" ")}"
    # puts cmd
    `#{cmd}`
  end

  def self.cleanup
    File.open(dokku_root.join('app/DOMAINS'), 'w') {|file| file.truncate(0) }
    File.open(dokku_root.join('sslapp/DOMAINS'), 'w') {|file| file.truncate(0) }
  end
end

ENV['DOKKU_ROOT'] = TestHelper.dokku_root.to_s