# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


#User.create(email: "example@example.com", password: "testme")
#menu = Menu.create(name: "default")
#page = Page.create(name: "Demo Homepage", permalink: "homepage", active: true, content: '<h1>Hi I am the demo homepage!</h1><p>Go to <a href="/admin/login">Admin Panel</a>, login and change me. Thank you for using me!</p>')
#menu.pages << page
#Setting.create(meta_key: "homepage", meta_value: page.id)

Element.create(name: "water")
Element.create(name: "air")
Element.create(name: "fire")
Element.create(name: "earth")

Element.create(name: "rain", parent1: "water", parent2: "air")
Element.create(name: "flood", parent1: "water", parent2: "water")
Element.create(name: "storm", parent1: "air", parent2: "air")
Element.create(name: "volcano", parent1: "fire", parent2: "earth")

