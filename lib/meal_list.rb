require 'twilio-ruby'

class Meal_List
    def initialize(io)
        @menu = []
        @selection = []
        @io = io
    end

    def add(menu_item)
        @menu << menu_item
    end

    def see_menu 
        return @menu
    end

    def create_order
        @io.puts "Could I please take your order?"
        @io.puts "Here are your options:"
        @io.puts see_menu
        @io.puts "How many items would you like to order?"
        
        # THE NUMBER OF ITEMS TO BE ORDERED
        number_of_orders = @io.gets.to_i

        @io.puts "Please enter the items"

        x = 0
        number_of_orders.times do 

            @selected_meal = @io.gets.chomp

            # SUM OF SELECTED MEAL PRICES
            @menu.select { |meal| meal["name"] == @selected_meal }.each { |meal| x += meal["price"].to_f}

            # SELECTED MEALS AND PRICES
            @selection << @menu.select { |meal| meal["name"] == @selected_meal }

        end

        @io.puts "Here is your order summary:"
        
        @order_summary = @selection.each.map { |array| "#{array[0]["name"]}: #{array[0]["price"]}" }

        @io.puts "#{@order_summary.join(", ")} = TOTAL: #{x}"
    end

    def send_order
        
    end
end