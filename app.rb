require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/customer")
require("./lib/animal")
require("pg")
require("pry")

DB = PG.connect({:dbname => "shelter"})

get("/") do
  erb(:index)
end

get("/animals/new") do
  erb(:animal_form)
end

get("/customers/new") do
  erb(:customers_form)
end

get("/animals/name") do
  @animals = Animal.name_sort()
  erb(:sort_name)
end

get("/animals/type") do
  @animals = Animal.type_sort()
  erb(:sort_type)
end

get("/animals/breed") do
  @animals = Animal.breed_sort()
  erb(:sort_breed)
end

get("/customers/breed") do
  @customers = Customer.cust_breed_sort()
  erb(:cust_sort_breed)
end

post("/animals") do
  name = params.fetch("name")
  gender = params.fetch("gender")
  date = params.fetch("date")
  type = params.fetch("type")
  breed = params.fetch("breed")
  animal = Animal.new({:name => name, :gender => gender, :date => date, :type => type, :breed => breed, :customer_id => nil})
  animal.save()
  erb(:index)
end

post("/customers") do
  name = params.fetch("name")
  phone = params.fetch("phone")
  type_preference = params.fetch("type_preference")
  breed_preference = params.fetch("breed_preference")
  id = params.fetch("id")
  customer = Customer.new({:name => name, :phone => phone, :type_preference => type_preference, :breed_preference => breed_preference, :id => nil})
  customer.save()
  erb(:index)
end

get('/animals') do
  @animals = Animal.all()
  erb(:animals)
end

get('/customers') do
  @customers = Customer.all()
  erb(:customers)
end
