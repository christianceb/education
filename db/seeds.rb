# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Subject.create( [
  { title: 'Math 101', description: 'Introductory Math' }, 
  { title: 'Math 102', description: 'Intermediate Math' }, 
  { title: 'Biology 110', description: 'Introductory Biology' }, 
  { title: 'Biology 111', description: 'Intermediate Biology' }, 
] )

Professor.create( [
  { name: 'George Washington' },
  { name: 'John Adams' },
  { name: 'Thomas Jefferson' },
  { name: 'James Madison' },
  { name: 'James Monroe' },
  { name: 'John Quincy Adams' },
  { name: 'Andrew Jackson' },
  { name: 'Martin Van Buren' },
  { name: 'William Henry Harrison' },
  { name: 'John Tyler' },
] )