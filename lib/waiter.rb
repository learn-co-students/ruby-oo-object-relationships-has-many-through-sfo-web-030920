class Waiter
  attr_accessor :name, :years_of_experience
  @@all = []

  def self.all
    @@all
  end

  def initialize(name, years_of_experience)
    @name = name
    @years_of_experience = years_of_experience
    save
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal| meal if meal.waiter == self }
  end

  def best_tipper
    best_tipped_meal = meals.max do |meal_a, meal_b|
      meal_a.tip <=> meal_b.tip
    end

    best_tipped_meal.customer
  end

  private

  def save
    @@all << self
  end
end
