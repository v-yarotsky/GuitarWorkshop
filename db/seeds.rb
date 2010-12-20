#encoding: utf-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

[ { :name => "Admin", :controller => "admin"}, { :name => "Manager", :controller => "orders"} ].each do |role|
  Role.create(role)
end

[
  { :name => "Admin", :login => "Admin", :password => "admin", :password_confirmation => "admin", :email => "admin@admins.com", :phone => "+3751111111", :role => Role.find_by_name("Admin") },
  { :name => "Chuck", :login => "chuck", :password => "chuck", :password_confirmation => "chuck", :email => "chuck@huitarworkshop.com", :phone => "+3752222222", :role => Role.find_by_name("Manager") }
].each do |user|
  User.create(user)
end

[
  { :name => "Bobby", :email => "vladimir.yarotsky@gmail.com", :phone => "+375297777777"},
  { :name => "Jack", :email => "jack@someone.smn", :phone => "+375290000000"}
].each do |client|
  Client.create(client)
end

[
  { :name => "Установка колка ESP-111", :description => "Установка графитового колка ESP-111", :price => 7.00 },
  { :name => "Установка колка Sperzel The D-Thing", :description => "Установка колка-курка Sperzel The D-Thing", :price => 14.00 }
].each do |service|
  Service.create(service)
end

