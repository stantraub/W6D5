require 'date'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ActiveRecord::Base.transaction do
  Cat.destroy_all
  cat1 = Cat.create!(
    birth_date: Date.new(2012, 12, 6), 
    color: :green, 
    name: 'Barry', sex: 'M', description: 'furry cat')
  cat2 = Cat.create!(
    birth_date: Date.new(2015, 5, 14), color: 'red',
    name: 'Bob', sex: 'M', description: 'fat cat')
  cat3 = Cat.create!(
    birth_date: Date.new(2017, 6, 17), color: 'blue',
    name: 'Lexi', sex: 'F', description: 'furry cat')
  cat4 = Cat.create!(
    birth_date: Date.new(2018, 11, 20), color: 'black',
    name: 'Billy', sex: 'M', description: 'furry cat')
end