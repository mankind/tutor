# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
@a = User.create!(email: 'lee@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Lee', :last_name => 'Lee')
@a.save

@b = User.create!(email: 'harry@test.com', password: 'abcdefgh', password_confirmation: 'abcdefgh', :first_name => 'Harry', :last_name => 'Harry')
@b.save

Mailboxer::Conversation.delete_all
@con = @a.send_message(@b, 'post from seed', 'seeds')
#@b.reply_to_conversation(@con, 'got the seeds', 'seeds')
@b.reply_to_all(@con, 'got the seeds')




