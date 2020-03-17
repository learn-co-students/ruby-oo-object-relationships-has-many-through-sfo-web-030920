class Customer
  attr_accessor :name, :age
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, age)
    @name = name
    @age = age
    save
  end

  def new_meal(waiter, total, tip)
    meal = Meal.new(waiter, self, total, tip)
    meal
  end

  def meals
    Meal.all.select { |meal| meal if meal.customer == self }
  end

  def waiters
    Meal.all.collect { |meal| meal.waiter if meal.customer == self }.compact!
  end

  private

  def save
    @@all << self
  end
end
