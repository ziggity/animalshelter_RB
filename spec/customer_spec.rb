require('spec_helper')

describe(Customer) do
  describe(".all") do
    it("starts off with no customers") do
      expect(Customer.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      customer = Customer.new({:name => "Greg", :phone => "555-555-5555", :type_preference => "cat", :breed_preference => "Russian Blue", :id => nil})
      expect(customer.name()).to(eq("Greg"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      customer = Customer.new({:name => "Greg", :phone => "555-555-5555", :type_preference => "cat", :breed_preference => "Russian Blue", :id => nil})
      customer.save()
      expect(customer.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("lets you save customers to the database") do
      customer = Customer.new({:name => "Greg", :phone => "555-555-5555", :type_preference => "cat", :breed_preference => "Russian Blue", :id => nil})
      customer.save()
      expect(Customer.all()).to(eq([customer]))
    end
  end

  describe("#==") do
    it("is the same customer if it has the same name") do
      customer1 = Customer.new({:name => "Greg", :phone => "555-555-5555", :type_preference => "cat", :breed_preference => "Russian Blue", :id => nil})
      customer2 = Customer.new({:name => "Greg", :phone => "555-555-5555", :type_preference => "cat", :breed_preference => "Russian Blue", :id => nil})
      expect(customer1).to(eq(customer2))
    end
  end
end
