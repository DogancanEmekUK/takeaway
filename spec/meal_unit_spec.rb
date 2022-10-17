require 'meal_list'
require 'meal'

RSpec.describe "Integration" do
    it "adds the meal and price to the menu" do
        menu = Meal_List.new
        meal_one = Meal.new("steak", "10.00")
        meal_two = Meal.new("chicken", "9.00")
        menu.add(meal_one.get_menu_item)
        menu.add(meal_two.get_menu_item)
        expect(menu.see_menu).to eq [{"name" => "steak", "price" => "10.00"}, {"name" => "chicken", "price" => "9.00"}]
    end
    it "creates an order according to the user selection and shows the order summary" do
        menu = Meal_List.new
        meal_one = Meal.new("steak", "10.50")
        meal_two = Meal.new("chicken", "9.00")
        meal_three = Meal.new("fish", "9.25")
        menu.add(meal_one.get_menu_item)
        menu.add(meal_two.get_menu_item)
        menu.add(meal_three.get_menu_item)
        menu.create_order([meal_two.get_menu_item, meal_three.get_menu_item])
        result = menu.order_summary
        expect(result).to eq "chicken: 9.00, fish: 9.25 = TOTAL: 18.25"
    end
    it "sends an order" do
        t = Time.now + (60*60)
        menu = Meal_List.new
        result = menu.create_sms
        expect(result).to eq "Sent from your Twilio trial account - Thank you! Your order was placed and will be delivered before #{t.hour}:#{t.min}"
    end
end