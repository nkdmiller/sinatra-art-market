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
		erb :'users/login', :layout => false
	end
	post '/users/login' do
	    @user = User.find_by(name: params[:user][:name], password: params[:user][:password])
	    if @user
	      session[:user_id] = @user.id
	      redirect to '/users'
	    else
	    	@fail = true
	    	erb :error
	    end
	end
	get '/users/:id' do
		@user = User.find(params[:id])
		erb :'users/show_user'
	end
	use Rack::MethodOverride
	  patch '/figures/:id' do
	    @user = User.find(params[:id])
	    if !params[:user][:name].empty?
			@user.update(name: params[:user][:name])
	    end
	    if !params[:user][:bio].empty?
			@user.update(bio: params[:user][:bio])
	    end

	    if !params[:landmark][:name].empty?
	      @landmark = Landmark.find_or_create_by(name: params[:landmark][:name], year_completed: params[:landmark][:year])
	      @landmark.save
	      @figure.landmarks << @landmark
	    end
	    if !!params[:figure][:landmark_ids]
	      params[:figure][:landmark_ids].each do |id|
	        @landmark = Landmark.find(id)
	        @landmark.save
	        @figure.landmarks << @landmark
	      end
	    end
	    redirect to "/figures/#{@figure.id}"
	  end
	get '/users/:id/edit_profile' do
		@user = User.find(params[:id])
		erb :'users/edit_profile'
	end
	get '/users/:id/change_password' do
		@user = User.find(params[:id])
		erb :'users/change_password'
	end
end