require 'meal_list'
require 'meal'

RSpec.describe "Integration" do
    it "adds the meal and price to the menu" do
        io = double :io
        menu = Meal_List.new(io)
        meal_one = Meal.new("steak", "10.00")
        meal_two = Meal.new("chicken", "9.00")
        menu.add(meal_one.get_menu_item)
        menu.add(meal_two.get_menu_item)
        expect(menu.see_menu).to eq [{"name" => "steak", "price" => "10.00"}, {"name" => "chicken", "price" => "9.00"}]
    end
    it "creates an order according to the user selection" do
        io = double :io

        menu = Meal_List.new(io)
        meal_one = Meal.new("steak", "10.50")
        meal_two = Meal.new("chicken", "9.00")
        meal_three = Meal.new("fish", "9.25")
        menu.add(meal_one.get_menu_item)
        menu.add(meal_two.get_menu_item)
        menu.add(meal_three.get_menu_item)

        expect(io).to receive(:puts).with("Could I please take your order?").ordered
        expect(io).to receive(:puts).with("Here are your options:").ordered
        expect(io).to receive(:puts).with(menu.see_menu).ordered
        expect(io).to receive(:puts).with("How many items would you like to order?").ordered
        expect(io).to receive(:gets).and_return("3").ordered
        expect(io).to receive(:puts).with("Please enter the items").ordered
        expect(io).to receive(:gets).and_return("steak").ordered
        expect(io).to receive(:gets).and_return("chicken").ordered
        expect(io).to receive(:gets).and_return("fish").ordered
        expect(io).to receive(:puts).with("Here is your order summary:").ordered
        expect(io).to receive(:puts).with("steak: 10.50, chicken: 9.00, fish: 9.25 = TOTAL: 28.75").ordered

        menu.create_order
    end
    it "sends an order" do
    end
end