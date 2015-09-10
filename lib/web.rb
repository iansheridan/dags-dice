require "sinatra/base"
require 'tilt/erb'

class Web < Sinatra::Base
  set server: 'thin', connections: []
  set :views, File.expand_path(File.join( "..", "..", "web", "views"), __FILE__)
  set :public_folder, File.expand_path(File.join( "..", "..", "web", "public"), __FILE__)

  get '/' do
    halt erb(:login) unless params[:user]
    erb :chat, locals: { user: params[:user].gsub(/\W/, '') }
  end
  get '/stream', provides: 'text/event-stream' do
    stream :keep_open do |out|
      settings.connections << out
      out.callback { settings.connections.delete(out) }
    end
  end
  post '/' do
    settings.connections.each { |out| out << "data: #{params[:msg]}\n\n" }
    204 # response without entity body
  end
end
