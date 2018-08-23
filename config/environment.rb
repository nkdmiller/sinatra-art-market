require 'bundler'

Bundler.require

ActiveRecord::Base.establish_connection(
	:adapter => "sqlite3",
	:database => "db/development.sqlite"
)
require_relative "../app/controllers/application_controller.rb"

require_all 'app'

