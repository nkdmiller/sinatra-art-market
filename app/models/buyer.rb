class Buyer < ActiveRecord::Base
  has_many :transactions
  has_many :artworks, through: :transactions
  belongs_to :user
end