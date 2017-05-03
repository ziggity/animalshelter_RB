require('capybara/rspec')
require('spec_helper')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new animal', {:type => :feature}) do
  it('allows a user to add a new animal') do
    visit('/')
    click_link('Add New Animal')
    fill_in('name', :with =>'Sherman')
    fill_in('gender', :with =>'male')
    fill_in('date', :with =>'01/31/2015')
    fill_in('type', :with =>'dog')
    fill_in('breed', :with =>'Goldendoodle')
    click_button('Add Animal')
    expect(page).to have_content('Welcome')
  end
end

describe("viewing all of the animals", {:type => :feature}) do
  it('allows a user to see a list of the animals') do
    animal = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
    animal.save()
    visit('/')
    click_link('View All Animals')
    expect(page).to have_content("Sherman")
  end
end

describe("viewing all of the customers", {:type => :feature}) do
  it('allows a user to see a list of the customers') do
    customer = Customer.new({:name => "Greg", :phone => "234234", :type_preference => "cat", :breed_preference => "Russian Blue", :id => 1})
    customer.save()
    visit('/')
    click_link('View All Customers')
    expect(page).to have_content("Greg")
  end
end

describe("viewing animals sorted by name", {:type => :feature}) do
  it('allows a user to see a list of animals sorted by name') do
    animal = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
    animal.save()
    visit('/')
    click_link('View All Animals')
    expect(page).to have_content("Currently Available")
    click_link('See Animals Sorted by Name')
    expect(page).to have_content("Sherman")
  end
end
