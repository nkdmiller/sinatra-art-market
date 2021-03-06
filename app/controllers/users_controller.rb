class UsersController < ApplicationController
	set :views, Proc.new { File.join(root, "../views/") }
	
	get '/users/signup' do
		erb :'users/signup', :layout => false
	end
	#for development purposes
	get '/users' do
		erb :'users/show'
	end
	#############
	post "/users" do
		if User.find_by(name: params[:user][:name])
		  @fail = true
		  erb :'users/signup', :layout => false
		else
		  @create = true
		  @user = User.create(:name => params[:user][:name], :password => params[:user][:password], :email => params[:user][:email], :bio => params[:user][:bio])
		  session[:user_id] = @user.id
		  redirect to '/artworks'
		end
	end
	get '/users/logout' do
		session.clear
		redirect to '/artworks'
	end
	#navbar and other layout not needed for login/signup forms
	get '/users/login' do
		erb :'users/login', :layout => false
	end
	post '/users/login' do
	    @user = User.find_by(name: params[:user][:name])
	    if @user && @user.authenticate(params[:user][:password])
	      session[:user_id] = @user.id
	      redirect to '/artworks'
	    else
	    	@fail = true
	    	erb :'/users/login', :layout => false
	    end
	end
	get '/users/:id' do
		@user = User.find(params[:id])
		@creator = @user.creator
		@buyer = @user.buyer
		erb :'users/show_user'
	end
	use Rack::MethodOverride
	  patch '/users/:id' do
	    @user = User.find(params[:id])
	    if !!params[:user][:name]
		    if !params[:user][:name].empty?
				@user.update(name: params[:user][:name])
		    end
		end
		if !!params[:user][:email]
		    if !params[:user][:email].empty?
				@user.update(email: params[:user][:email])
		    end
		end
		if !!params[:user][:bio]
		    if !params[:user][:bio].empty?
				@user.update(bio: params[:user][:bio])
		    end
		end
		if !!params[:user][:password]
			@user.update(password: params[:user][:password])
		end
	    @success = true
	    redirect to "/users/#{@user.id}"
	  end
	get '/users/:id/edit_profile' do
		@user = User.find(params[:id])
		if Helpers.is_logged_in?(session)
			if Helpers.current_user(session).id == @user.id
				erb :'users/edit_profile'
			else
				redirect to "/artworks"
			end
		else
			redirect to "/artworks"
		end
	end
	get '/users/:id/change_password' do
		@user = User.find(params[:id])
		if Helpers.is_logged_in?(session)
			if Helpers.current_user(session).id == @user.id
				erb :'users/change_password'
			else
				redirect to "/artworks"
			end
		else
			redirect to "/artworks"
		end
	end
	get '/users/:id/transaction-redirect' do
		@transaction_success = true
		@user = User.find(params[:id])
		@creator = @user.creator
		@buyer = @user.buyer
		erb :'users/show_user'
	end
end