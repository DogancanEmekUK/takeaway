class Meal_List
    def initialize(io) #INITIALIZE THE MENU
        @menu = []
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
        @io.puts @menu
        p selected_meal = @io.gets.chomp.split
        @io.puts "Here is your order summary:"

        #SUM OF SELECTED MEAL PRICES
        x = 0
        sum = (@menu.select { |meal| meal["name"] == selected_meal }).each { |meal| x += meal["price"].to_f}

        @io.puts (@menu.select { |meal| meal["name"] == selected_meal })
        .map { |meal| "#{meal["name"]}: #{meal["price"]} = TOTAL: #{x}" }
    end

    def send_order
    end

    def receive_text
    end
end