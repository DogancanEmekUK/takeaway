require 'meal'

RSpec.describe Meal do
    it "returns the name of the meal" do
        meal = Meal.new("steak", "10.00")
        expect(meal.name).to eq "steak"
    end
    it "returns the price of the meal" do
        meal = Meal.new("steak", "10.00")
        expect(meal.price).to eq "10.00"
    end
    it "returns the name and the price in a formatted way" do
        meal = Meal.new("steak", "10.00")
        expect(meal.get_menu_item).to eq "name" => "steak", "price" => "10.00"
    end
end