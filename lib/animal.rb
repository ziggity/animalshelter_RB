class Animal
  attr_reader(:name, :gender, :date, :type, :breed, :customer_id)

  define_method(:initialize) do |attributes|
    @name =  attributes.fetch(:name)
    @gender =  attributes.fetch(:gender)
    @date =  attributes.fetch(:date)
    @type =  attributes.fetch(:type)
    @breed =  attributes.fetch(:breed)
    @customer_id =  attributes.fetch(:customer_id)
  end

    define_singleton_method(:name_sort) do
      sorted_names = DB.exec("SELECT * FROM animals ORDER BY name ASC;")
    end

    define_singleton_method(:type_sort) do
      sorted_types = DB.exec("SELECT * FROM animals ORDER BY type ASC;")
    end

    define_singleton_method(:breed_sort) do
      sorted_breeds = DB.exec("SELECT * FROM animals ORDER BY breed ASC;")
    end

    define_method(:==) do |another_animal|
      self.name().==(another_animal.name())
    end

    define_singleton_method(:all) do
      returned_animals = DB.exec("SELECT * FROM animals;")
    end

    define_method(:save) do
      DB.exec("INSERT INTO animals (name, gender, date, type, breed, customer_id) VALUES ('#{@name}', '#{@gender}', '#{@date}', '#{@type}', '#{@breed}', #{@customer_id.to_i});")
    end

end
