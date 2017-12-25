require "#{File.dirname(__FILE__)}/app"
require "#{File.dirname(__FILE__)}/plugins/poweroff_plugin.rb"

run Unicorn::App
