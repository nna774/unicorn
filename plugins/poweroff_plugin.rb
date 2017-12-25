# frozen_string_literal: true

require_relative '../app'


module Unicorn
  class App < Sinatra::Base
    poweroff_path = '/poweroff'

    before poweroff_path do
      if (ENV['ENABLE_POWEROFF'] != 'true') || (ENV['POWEROFF_TOKEN'].nil?)
        return json({text: 'poweroff plugin is disabled', })
      end
      return halt 403, json({text: 'token mismatch'}) if ENV['POWEROFF_TOKEN'] != params[:token]
      return halt 403, json({text: 'user mismatch'}) if ENV['POWEROFF_USER_ID'] != params[:user_id]
    end
      
    post poweroff_path do
      @ok = true
      json({text: 'ok! starting power off', })
    end

    after poweroff_path do
      if @ok
        pid = spawn 'sleep 10; sudo poweroff'
        Process.detach(pid)
      end
    end
  end
end
