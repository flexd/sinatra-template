require 'rubygems'
require "bundler/setup"
require 'haml'
require 'ostruct'

require 'sinatra' unless defined?(Sinatra)
require 'sinatra-mongoid-config'

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Your Application Name',
                 :author => 'Your Name',
                 :url_base => 'http://localhost:4567/',
                 :db_name => 'sinatra-template'
  )
  set :mongo_db, "#{SiteConfig.db_name}_#{Sinatra::Base.environment}"
  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
  
end
