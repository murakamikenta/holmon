namespace :db do
  desc "Fill database with sample data"
  task sample: :environment do
    make_users
    make_posts
  end
end

def make_users
  User.delete_all
  if Rails.env.development?
    #User.connection.execute("ALTER TABLE users AUTO_INCREMENT = 1")
    User.connection.execute("delete from sqlite_sequence where name='users'")
  elsif Rails.env.test?
    User.connection.execute("delete from sqlite_sequence where name='users'")
  else
    User.connection.execute("SELECT SETVAL('users_id_seq',1,FALSE)")
  end
  # create!はfalseを返さずに例外を発生させる:エラーに気づくため
  User.create!(
    name: "demo",
    email: "demo@holmon.jp",
    tel: "1",
    password: "demo",
    password_confirmation: "demo")
  User.create!(
    name: "山田 三郎",
    email: "yamada@holmon.jp",
    tel: "2",
    password: "yamada",
    password_confirmation: "yamada")
    
  admin = User.create!(
    name: "admin",
    email: "admin@holmon.jp",
    tel: "0",
    password: "admin",
    password_confirmation: "admin")
    
  admin.toggle!(:admin)
  
  50.times do |n|
    name =Faker::Name.name
    email = "holmon-#{n+1}@holmon.jp"
    password = "password"
    User.create!(name: name, 
                        email: email,
                        password: password,
                        password_confirmation: password)
  end
end

def make_posts
  Post.delete_all
  if Rails.env.development?
    #User.connection.execute("ALTER TABLE users AUTO_INCREMENT = 1")
    Post.connection.execute("delete from sqlite_sequence where name='posts'")
  elsif Rails.env.test?
    Post.connection.execute("delete from sqlite_sequence where name='posts'")
  else
    Post.connection.execute("SELECT SETVAL('posts_id_seq',1,FALSE)")
  end
  u = User.find(1)
  
  u.posts.build(
    title: "トマトいりません？",
    body: "１０００円で２０個です",
    quantity: 20,
    unit: "個",
    price: 1000,
    place: "岡山県美作市"
  ).save!
  
  u.posts.build(
    title: "冷蔵庫いりません？",
    body: "一人暮らし用１０年ものです",
    quantity: 1,
    unit: "個",
    price: 0,
    place: "岡山県津山市"
  ).save!
  
  u.posts.build(
    title: "栗がたくさん取れましたのでお分けします",
    body: "敷地内の栗の木です。",
    quantity: 1,
    unit: "袋",
    price: 300,
    place: "岡山県勝央町"
  ).save!
  
u = User.find(2)
  u.posts.build(
    title: "いちごジャム用",
    body: "１Kgで５００円です",
    quantity: 1,
    unit: "Kg",
    price: 500,
    place: "岡山県奈義町"
  ).save!
  
  u.posts.build(
    title: "いちごジャム用",
    body: "１Kgで５００円です",
    quantity: 1,
    unit: "Kg",
    price: 500,
    place: "岡山県奈義町",
    closed_at: "2013-10-11 01:58:08.362411"
  ).save!
  
end

