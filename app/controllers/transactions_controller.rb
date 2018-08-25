class TransactionsController < ApplicationController

	get '/transactions/:user_id/:artwork_id/new' do
		@artwork = Artwork.find(params[:artwork_id])
		@user = User.find(params[:user_id])
		erb :'transactions/new'
	end
	post '/transactions/:user_id/:artwork_id' do
		@user = User.find(params[:user_id])
		@artwork = Artwork.find(params[:artwork_id])
		@success = true
		@buyer = Buyer.find_or_create_by(:user_id => session[:user_id])
		@buyer.save
		@artwork.quantity = @artwork.quantity.to_i - params[:transaction][:quantity_sold].to_i
		@artwork.save
		@transaction = Transaction.create(:artwork_id => @artwork.id, :buyer_id => @buyer.id, :quantity_sold => params[:transaction][:quantity_sold], :note => params[:transaction][:note])
		@transaction.save
		erb :"users/show_user"
	end
	use Rack::MethodOverride
	get '/transactions/:id/edit' do
		@transaction = Transaction.find(params[:id])
		@artwork = Artwork.find(@transaction.artwork_id)
		erb :'transactions/edit'
	end
	patch '/transactions/:id' do  
		@transaction = Transaction.find(params[:id])
		@artwork = Artwork.find(@transaction.artwork.id)
		if !params[:transaction][:quantity_sold].empty?
			@artwork.quantity = @artwork.quantity.to_i + @transaction.quantity_sold.to_i
			@transaction.update(quantity_sold: params[:transaction][:quantity_sold])
			@artwork.quantity = @artwork.quantity.to_i - params[:transaction][:quantity_sold].to_i
			@artwork.save
	    end
		if !params[:transaction][:note].empty?
			@transaction.update(note: params[:transaction][:note])
	    end
	    redirect to "/users/#{@transaction.buyer.user.id}/transaction-redirect"
	end
	delete '/transactions/:id/delete' do
		@transaction = Transaction.find(params[:id])
	    @artwork = Artwork.find(@transaction.artwork.id)
	    @artwork.quantity = @artwork.quantity.to_i + @transaction.quantity_sold.to_i
	    @transaction.delete
	    redirect to "/users/#{@transaction.buyer.user.id}/transaction-redirect"
 	end
end