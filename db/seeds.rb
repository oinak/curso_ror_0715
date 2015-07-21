# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Post.delete_all

30.times do |n|
  post = Post.create(title:       "El enlace número #{n}",
                     url:         "http://www.enlace#{n}.com",
                     description: "Lorem ipsum dolor sit amet, non sequitur",
                     published:   n.even?)
  post.created_at = n.days.ago
  post.save!
end
