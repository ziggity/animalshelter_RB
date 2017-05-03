require('spec_helper')

describe(Animal) do
  describe("#==") do
    it("is the same animal if it has the same name") do
      animal1 = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
      animal2 = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
      expect(animal1).to(eq(animal2))
    end
  end

  describe(".all") do
    it("starts off with no animals") do
      expect(Animal.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
    animal = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
    end
  end

  describe("#save") do
    it("adds an animal to the array of saved animals") do
    test_animal = Animal.new({:name => "Sherman", :gender => "male", :date => "01/31/2015", :type => "dog", :breed => "Goldendoodle", :customer_id => 1})
    test_animal.save()
    expect(Animal.all()).to(eq([test_animal]))
    end
  end

end
