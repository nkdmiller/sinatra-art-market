class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
		# enable :sessions
		# set :session_secret, "artmarket"
	end

	get '/' do
		"Hello World"
	end

	get '/figures' do
		"figureas"
	end
end