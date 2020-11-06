10.times do
    User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password")
end

5.times do
    
    Garden.create(name: "#{Faker::Book.title}", location: "#{Faker::House.room}")
end

Plant.create(name:'Haworthia', species:'Haworthia species', user_id: rand(1..10))
Plant.create(name:'Hoya Kerrii', species:'Hoya kerrii', user_id: rand(1..10))
Plant.create(name:'Jade Plant', species:'Crassula ovata', user_id: rand(1..10))
Plant.create(name:'Living Stones', species:'Lithops species', user_id: rand(1..10))
Plant.create(name:'Madagascar Palm', species:'Pachypodium lamerei', user_id: rand(1..10))
Plant.create(name:'Mistletoe Cactus', species:'Rhipsalis baccifera', user_id: rand(1..10))
Plant.create(name:'Mother-in-Law’s Tongue or Snake Plant', species:'Sansevieria trifasciata', user_id: rand(1..10))
Plant.create(name:'Mother of Thousands', species:'Kalanchoe daigremontiana', user_id: rand(1..10))
Plant.create(name:'Orchid Cactus', species:'Epiphyllum species and hybrids', user_id: rand(1..10))
Plant.create(name:'Paddle Plant', species:'Kalanchoe thyrsiflora', user_id: rand(1..10))
Plant.create(name:'Panda Plant', species:'Kalanchoe tomentosa', user_id: rand(1..10))
Plant.create(name:'Ponytail Palm', species:'Beaucarnea recurvata', user_id: rand(1..10))
Plant.create(name:'String of Pearls', species:'Senecio rowleyanus', user_id: rand(1..10))
Plant.create(name:'Sedum rubrotinctum or Jelly Bean Plant', species:'Sedum rubrotinctum', user_id: rand(1..10))
Plant.create(name:'Thanksgiving Cactus', species:'Schlumbergera truncata', user_id: rand(1..10))
Plant.create(name:'Tiger’s Jaw', species:'Faucaria tigrina', user_id: rand(1..10))
Plant.create(name:'Yucca', species:'Yucca elephantipes', user_id: rand(1..10))