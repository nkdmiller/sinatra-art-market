class UsersController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/") }
	
	get '/users/signup' do
		erb :signup
	end
	get '/users' do
		session.clear
		@create = false
		erb :success
	end
	post "/users" do
		@create = true
	  @user = User.new(:name => params[:user][:name], :password => params[:user][:password], :email => params[:user][:email])
	  session[:user_id] = @user.id
	  @session = session
	  if @user.save
	    erb :success
	  else
	    erb :error
	  end
	end
	get '/users/login' do
		"Display Login here"
	end
	get '/users/:id' do
		"Display User Here"
	end
end