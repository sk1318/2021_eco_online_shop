# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create(email: 'sk2322@example.com',   password: 'SiSikosuke')
Genre.create!(name: "ケーキ")
Item.create!(genre_id:1,name: "モンブラン",introduction: "おいしいです",price: 200)
Item.create!(genre_id:1,name: "チョコレートケーキ",introduction: "おいしいです",price: 200)
Item.create!(genre_id:1,name: "ショートケーキ",introduction: "おいしいです",price: 200)
Item.create!(genre_id:4,name: "レモンケーキ",introduction: "おいしいです",price: 200)