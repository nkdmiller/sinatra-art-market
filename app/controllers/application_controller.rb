class ApplicationController < Sinatra::Base
	require_all 'app'
	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "artmarket"
	end
	get '/' do
		redirect to '/artworks'
	end
end