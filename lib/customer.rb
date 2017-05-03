class Customer
  attr_reader(:name, :phone, :type_preference, :breed_preference, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @phone = attributes.fetch(:phone)
    @type_preference = attributes.fetch(:type_preference)
    @breed_preference = attributes.fetch(:breed_preference)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:cust_breed_sort) do
    sorted_breed_preference = DB.exec("SELECT * FROM customers ORDER BY breed_preference ASC;")
  end

  define_singleton_method(:all) do
    returned_customers = DB.exec("SELECT * FROM customers;")
    customers = []
    returned_customers.each() do |customer|
      name = customer.fetch("name")
      phone = customer.fetch("phone")
      type_preference = customer.fetch("type_preference")
      breed_preference = customer.fetch("breed_preference")
      id = customer.fetch("id").to_i()
      customers.push(Customer.new({:name => name, :phone => phone, :type_preference => type_preference, :breed_preference => breed_preference, :id => id}))
    end
    customers
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO customers (name, phone, type_preference, breed_preference) VALUES ('#{@name}', '#{@phone}', '#{@type_preference}', '#{@breed_preference}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_customer|
    self.name().==(another_customer.name()).&(self.id().==(another_customer.id()))
  end
end
