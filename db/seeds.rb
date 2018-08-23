users_list = {
    "Mark" => {
      :email => "mark@example.com",
      :password => "password",
      :bio => "My name is Mark, I'm an art seller."
    },
    "Rachael" => {
      :email => "rachael@example.com",
      :password => "password",
      :bio => "My name is Rachael, I'm a painter."
    },
    "Stefan" => {
      :email => "stefan@example.com",
      :password => "password",
      :bio => "My name is Stefan, I'm an art buyer."
    }    
  }

users_list.each do |name, user_hash|
  p = User.new
  p.name = name
  user_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save
end

users = [1,2]

users.each do |id|
  p = Creator.new
  p.user_id = id
  p.save
end

users.each do |id|
  p = Buyer.new
  p.user_id = id
  p.save
end


artwork_list = {
    "Bold and Brash" => {
      :creator_id => 2,
      :price => "50.00",
      :img => "placeholder",
      :description => "Prints of a modern masterpiece.",
      :quantity => 50
    },
    "The Kiss 2.0" => {
      :creator_id => 1,
      :price => "5000.00",
      :img => "placeholder",
      :description => "A modern day renidition of a magnificent sculpture.",
      :quantity => 1
    }
  }

artwork_list.each do |name, artwork_hash|
  p = Artwork.new
  p.name = name
  artwork_hash.each do |attribute, value|
      p[attribute] = value
  end
  p.save 
end