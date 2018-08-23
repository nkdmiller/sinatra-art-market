class Creator < ActiveRecord::Base
  has_many :artworks
  belongs_to :user
end