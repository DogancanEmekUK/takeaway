class Meal
    def initialize(name, price)
        @name = name
        @price = price
    end
    def name
        return @name
    end
    def price
        return @price
    end
    def get_menu_item
        @menu_item = {}
        @menu_item["name"] = @name
        @menu_item["price"] = @price
        return @menu_item
    end
end