# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(email: 'sk2322@example.com',   password: 'SiSikosuke')
Customer.create!(email: '3222@example.com',password: 'DmmWebcamp',last_name: "田中",
first_name: "太郎",last_name_kana: "タナカ",first_name_kana: "タロウ",zip_code: "888-888",address: "東京都あきる野市",telephone_number: "000-000-0000")
Genre.create!(name: "皿系")
Genre.create!(name: "丼系")
Genre.create!(name: "トレー系")
Genre.create!(name: "その他")
Item.create!(genre_id:1,name: "平皿",introduction: "ホットケーキ等で使います。",price: 200,image: File.open("./app/assets/images/kamizara.jpeg"))
Item.create!(genre_id:2,name: "丼容器",introduction: "どんぶり、おでん等で使います。",price: 200,image: File.open("./app/assets/images/donburi.jpeg"))
Item.create!(genre_id:3,name: "食品トレー",introduction: "焼きそばやチヂミ等で使います",price: 200,image: File.open("./app/assets/images/syokuhintore.jpeg"))
Item.create!(genre_id:4,name: "ホットドッグトレー",introduction: "ホットドッグ等で使います。",price: 200,image: File.open("./app/assets/images/hotdog.jpeg"))
Address.create!(customer_id: 1,zip_code: "197-4437",address: "東京都新宿区４－５",name: "鈴木正久")
