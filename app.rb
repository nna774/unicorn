# frozen_string_literal: true

require 'sinatra'
require 'sinatra/json'

module Unicorn
  class App < Sinatra::Base
    get '/' do
      'えへへ、もっと頑張るね？お兄ちゃん'
    end

    post '/echo' do
      json({
        text: "@#{params[:user_name]} #{params[:text]}",
        link_names: true,
      })
    end
  end
end
