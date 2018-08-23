class Artwork < ActiveRecord::Base
  has_many :buyers, through: :transactions
  has_many :transactions
  belongs_to :creator
end