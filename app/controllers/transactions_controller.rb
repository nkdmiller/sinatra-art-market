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
		@transaction = Transaction.create(:artwork_id => @artwork.id, :buyer_id => @buyer.id, :quantity_sold => params[:transaction][:quantity_sold], :note => params[:transaction][:note])
		@transaction.save
		erb :"users/show_user"
	end
end