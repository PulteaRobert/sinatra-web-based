# frozen_string_literal: true

require "sequel"
require "sinatra"
set :bind, "0.0.0.0"

enable :sessions
set :session_secret, "Pm@H^274c2Rm$B#%T&33aiW#ft4$V#"

include ERB::Util

require "require_relative"

require_relative "db/db"

require "require_all"
require_all "controllers"
require_all "models"

get "/need-login" do
  erb :need_login
end

get "/success" do
  erb :success
end

get "/no-permission" do 
  erb :no_permission
end

get "/delete" do 
  erb :delete
end

get "/logout" do
  erb :logout
end

get "/invalid-account" do
  erb :invalid_account
end

get "/" do
  erb :index
end
