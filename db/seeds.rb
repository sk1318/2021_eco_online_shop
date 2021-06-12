# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'sk2322@example.com',   password: 'SiSikosuke')
Genre.create!(name: "ケーキ")
Item.create!(genre_id:1,name: "モンブラン",introduction: "おいしいです",price: 200,image_id: "5d833624814b5a0afdc4ba3dcac5b33a1da8cf118a3ac4dd7393f13e3e1a")
Item.create!(genre_id:1,name: "ショートケーキ",introduction: "おいしいです",price: 200,image_id: "5d833624814b5a0afdc4ba3dcac5b33a1da8cf118a3ac4dd7393f13e3e1a")
Item.create!(genre_id:1,name: "チョコレートケーキ",introduction: "おいしいです",price: 200,image_id: "5d833624814b5a0afdc4ba3dcac5b33a1da8cf118a3ac4dd7393f13e3e1a")
Item.create!(genre_id:1,name: "イチゴケーキ",introduction: "おいしいです",price: 200,image_id: "5d833624814b5a0afdc4ba3dcac5b33a1da8cf118a3ac4dd7393f13e3e1a")
