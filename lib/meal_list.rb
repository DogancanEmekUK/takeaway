require 'twilio-ruby'
require 'dotenv/load'

class Meal_List
    def initialize()
        @menu = []
    end

    def add(menu_item)
        @menu << menu_item
    end

    def see_menu 
        return @menu
    end

    def create_order(order)
        sum = 0
        meal_summary = order.map { |meal| "#{meal["name"]}: #{meal["price"]}" }
        order.map { |meal| sum += meal["price"].to_f }
        @order_summary = "#{meal_summary.join(", ")} = TOTAL: #{sum}"
    end

    def order_summary
        return @order_summary
    end

    def send_order
        t = Time.now + (60*60)

        account_sid = ENV["ACCOUNT_SID"]
        auth_token = ENV["AUTH_TOKEN"]

        @client = Twilio::REST::Client.new(account_sid, auth_token)
        message = @client.messages.create(
            body: "Thank you! Your order was placed and will be delivered before #{t.hour}:#{t.min}",
            to: "+447312525246",
            from: "+18588004049")
        return message.body
    end
end