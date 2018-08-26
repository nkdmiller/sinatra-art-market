class ArtworksController < ApplicationController
	get '/artworks' do
		@create = false
		erb:'artworks/show'
	end
	get '/artworks/new' do
		erb:'artworks/new', :layout => false
	end
	#@create is checked when artworks/show is rendered to flash validation message
	post "/artworks" do
		@create = true
	  @creator = Creator.find_or_create_by(:user_id => session[:user_id])
	  @creator.save
	  @artwork = Artwork.create(:name => params[:artwork][:name], :img => params[:artwork][:img], :quantity => params[:artwork][:quantity], :price => params[:artwork][:price], :description => params[:artwork][:description], :creator_id => @creator.id)
	  @artwork.save
	  erb:'artworks/show'
	end
	get '/artworks/:id' do
		@artwork = Artwork.find(params[:id])
		erb:'artworks/show_artwork'
	end
	get '/transactions/:id/buy' do
		erb:'artworks/buy', :layout => false
	end

	get '/artworks/:id/edit' do
		@artwork = Artwork.find(params[:id])
		erb:'artworks/edit_artwork', :layout => false
	end	
	#Rack:MethodOverride allows for patch and delete requests
	use Rack::MethodOverride
	  patch '/artworks/:id' do
	    @artwork = Artwork.find(params[:id])
	    if !params[:artwork][:name].empty?
			@artwork.update(name: params[:artwork][:name])
	    end
	    if !params[:artwork][:img].empty?
			@artwork.update(img: params[:artwork][:img])
	    end
	    if !params[:artwork][:quantity].empty?
			@artwork.update(quantity: params[:artwork][:quantity])
	    end
	    if !params[:artwork][:price].empty?
			@artwork.update(price: params[:artwork][:price])
	    end
	    if !params[:artwork][:description].empty?
			@artwork.update(description: params[:artwork][:description])
	    end
	    redirect to "/artworks/#{@artwork.id}"
	  end
	delete '/artworks/:id/delete' do
	    @artwork = Artwork.find(params[:id])
	    @artwork.delete
	    @deleted = true
	    erb:"artworks/show"
 	end
 	get '/artworks/:id/buy' do
 		@artwork = Artwork.find(params[:id])
 		erb:'transactions/new'
 	end
end