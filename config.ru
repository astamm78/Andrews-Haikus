# Require config/environment.rb
require ::File.expand_path('../config/environment',  __FILE__)

set :app_file, __FILE__

configure do
  # See: http://www.sinatrarb.com/faq.html#sessions
  enable :sessions
  set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'

  # Set the views to
  set :views, File.join(Sinatra::Application.root, "app", "views")
end

$:.unshift File.expand_path(File.dirname(__FILE__))
require "app"
require 'newrelic_rpm'
NewRelic::Agent.after_fork(:force_reconnect => true)

run Sinatra::Application
