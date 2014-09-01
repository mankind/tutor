# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
@a = User.create!(email: 'lee@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Lee', :last_name => 'Lee', role: 'tutor')
#@a.role = tutor
@a.save
@b = User.create!(email: 'harry@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Harry', :last_name => 'Harry',  role: 'student')
#@b.role = student
@b.save
