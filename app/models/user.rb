class User < ActiveRecord::Base
  has_one :buyer
  has_one :creator
end