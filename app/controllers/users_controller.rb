class UsersController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/") }
	
	get '/users/signup' do
		erb :'users/signup', :layout => false
	end
	get '/users' do
		@create = false
		erb :'users/show'
	end
	post "/users" do
		@create = true
	  @user = User.create(:name => params[:user][:name], :password => params[:user][:password], :email => params[:user][:email])
	  session[:user_id] = @user.id
	  if @user.save
	    erb :'users/show'
	  else
	    erb :'errors/signup'
	  end
	end
	get '/users/logout' do
		session.clear
		erb :'users/show'
	end
	get '/users/login' do
		erb :'users/login'
	end
	post '/users/login' do
	    @user = User.find_by(username: params["username"], password: params["password"])
	    if @user
	      session[:user_id] = @user.id
	      redirect to '/users'
	    else
	    	@fail = true
	    	erb :error
	    end
	end
	get '/users/:id' do
		"Display User Here"
	end
end