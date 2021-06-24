# 1 = https://www.google.com/maps/place/Centro+Comercial+Cable+Plaza/@5.0607434,-75.4922828,15z/data=!4m5!3m4!1s0x8e47657eb7f0cc1d:0x77d5212e2c609bb9!8m2!3d5.05617!4d-75.4857462
# 2 = https://www.google.com/maps/place/Mallplaza+Manizales+Centro+Comercial/@5.0607434,-75.4922828,15z/data=!4m5!3m4!1s0x0:0x43d09f94b08b4667!8m2!3d5.065343!4d-75.4898468
# 3 = https://www.google.com/maps/place/Homecenter+-+Manizales/@5.0607434,-75.4922828,15z/data=!4m5!3m4!1s0x8e476578ed619995:0xffe8d5eee305e28d!8m2!3d5.0554493!4d-75.4808029
# 4 = https://www.google.com/maps/place/Centro+Comercial+Sancancio/@5.0559582,-75.4904252,15.25z/data=!4m5!3m4!1s0x8e47657a55203e81:0xb01b692bb676b3af!8m2!3d5.0536272!4d-75.4899138
#5 = https://www.google.com/maps/place/Centro+Comercial+Fundadores/@5.0693784,-75.5182895,15z/data=!4m5!3m4!1s0x8e476ff17d720769:0x54ae4896a63a8193!8m2!3d5.0693791!4d-75.5095354

pos = 0
rid = 1
(0..9).each do |i|
  role = i % 2 == 0 ? "rider" : "driver"
  user = User.new role: role
  user.secure_uuid_and_tokens
  if role == "rider"
    user.name = "Cool Rider - #{rid}"
    user.email = "coolrider_#{rid}@examplerideordrive.com"
    user.save
    rider = user.create_rider
    rid += 1
  else
    user.name = "Cool Driver - #{positions[pos][2]}"
    user.email = "cooldriver_#{pos+1}@examplerideordrive.com"
    user.save

    driver = user.create_driver current_lat: Driver::DUMMY_POSITIONS[pos][0], current_lng: Driver::DUMMY_POSITIONS[pos][1], status: Driver::ACTIVE
    pos += 1
  end
  puts "User Created => #{user.name}"
end
