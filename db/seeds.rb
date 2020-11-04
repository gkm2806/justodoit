# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

testnildo = User.create(email: 'Testenildo@ig.com', password: 'supertest123', name: 'Testenildo')
testnildo.lists.create(name: 'Lista do Testenildo', shared: true)

kukiel = User.create(email: 'gabrielkukiel@gmail.com', password: 'supersecret123', name: 'Kukiel')
kukiel.lists.create(name: 'acordar', shared: true)
List.second.items.create(content: 'Tomar café')
List.second.items.create(content: 'Arrumar a Cama')
List.second.items.create(content: 'Regar as plantinhas')
Item.first.items.create(content: 'Esquentar agua')
Item.first.items.create(content: 'Moer café')