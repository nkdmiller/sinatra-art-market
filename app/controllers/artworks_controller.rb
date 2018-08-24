class ArtworksController < ApplicationController
	get '/artworks' do
		@create = false
		erb:'artworks/show'
	end
	get '/artworks/new' do
		erb:'artworks/new', :layout => false
	end
	post "/artworks" do
		@create = true
		creator_id, photo, image_path, quantity, buyer_id, price, description
	  @artwork = Artwork.create(:name => params[:artwork][:name], :photo => params[:artwork][:name], :quantity => params[:artwork][:quantity], :price => params[:artwork][:price], :description => params[:artwork][:description], :creator_id => params[:artwork][:creator_id])
	  @artwork.save
	  redirect to '/artworks'
	end
	get '/artworks/:id/buy' do
		erb:'artworks/buy', :layout => false
	end
	get '/artworks/:id/edit' do
		erb:'artworks/edit', :layout => false
	end	

end