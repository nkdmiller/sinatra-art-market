users_list = {
    "Mark" => {
      :email => "mark@example.com",
      :password => "password",
      :bio => "My name is Mark, I'm an art seller."
    },
    "Rachael" => {
      :email => "rachael@example.com",
      :password => "password",
      :bio => "My name is Rachael, I'm a trader of rare paintings."
    },
    "Stefan" => {
      :email => "stefan@example.com",
      :password => "password",
      :bio => "My name is Stefan, I'm an art buyer."
    },
     "Pat" => {
      :email => "pat@example.com",
      :password => "password",
      :bio => "My name is Pat, I'm a silversmith."
    },
     "Alfred" => {
      :email => "alfred@example.com",
      :password => "password",
      :bio => "My name is Alfred, I work at the Met."
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

users = [1,2,3,4,5]

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
      :price => "5.00",
      :img => "bold_and_brash.jpg",
      :description => "Prints of a modern masterpiece.",
      :quantity => 50
    },
    "The Kiss" => {
      :creator_id => 1,
      :price => "59,000.00",
      :img => "the_kiss.jpg",
      :description => "A magnificent sculpture by Auguste Rodin.",
      :quantity => 1
    },
    "Guernica" => {
      :creator_id => 1,
      :price => "100,000.00",
      :img => "guernica.jpg",
      :description => "A striking Picasso painting inspired by the Spanish Civil War.",
      :quantity => 1
    },
    "Portrait of a Lady" => {
      :creator_id => 5,
      :price => "90,000.00",
      :img => "portrait_of_a_lady.jpg",
      :description => "A masterpiece straight from the Met archives.",
      :quantity => 1
    },
    "Adoration of the Magi" => {
      :creator_id => 5,
      :price => "85,000.00",
      :img => "adoration_of_the_magi.jpg",
      :description => "A masterpiece straight from the Met archives.",
      :quantity => 1
    },
    "Two Young Girls at the Piano" => {
      :creator_id => 5,
      :price => "76,000.00",
      :img => "two_young_girls_at_the_piano.jpg",
      :description => "A masterpiece straight from the Met archives.",
      :quantity => 1
    },
    "Silver Candlesticks" => {
      :creator_id => 4,
      :price => "49.99",
      :img => "candlestick.jpg",
      :description => "Silver candlestick from an expert silversmith.",
      :quantity => 8
    },
    "Silver Pots" => {
      :creator_id => 4,
      :price => "39.99",
      :img => "chocolate_pot.jpg",
      :description => "Silver pot from an expert silversmith.",
      :quantity => 8
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