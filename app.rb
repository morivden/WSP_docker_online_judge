require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/excontainer'

get '/' do
  slim :index
end

