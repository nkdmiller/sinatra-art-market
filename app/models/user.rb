class User < ActiveRecord::Base
	has_one :buyer
	has_one :creator
	has_secure_password
end