class UsersController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/") }
	get '/users' do
		erb :signup
	end
	post "/signup" do
	  user = User.new(:name => params[:name], :password => params[:password])
	  if user.save
	    redirect "/login"
	  else
	    redirect "/failure"
	  end
	end
	get '/users/login' do
		"Display Login here"
	end
	get '/users/:id' do
		"Display User Here"
	end
end