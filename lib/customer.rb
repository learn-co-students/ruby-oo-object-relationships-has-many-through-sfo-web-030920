class Customer
  
  attr_accessor :name, :age
  @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end
  
  def self.all
    @@all 
  end 
  
  def new_meal(waiter, total, tip)
    newmeal = Meal.new(waiter, self, total, tip)
    newmeal
  end
  
  def meals
    people = Meal.all.select{|meal| meal.customer == self}
    people
  end
  
  def waiters
    meals.map {|meal| meal.waiter}
  end
  
  
end