require 'twilio-ruby'

account_sid = "AC06bcdbe053a2c2b1b126682878e929ec" # Your Test Account SID from www.twilio.com/console/settings
auth_token = "4de3f26102828dbcba5b7bdc544a6650"   # Your Test Auth Token from www.twilio.com/console/settings

@client = Twilio::REST::Client.new(account_sid, auth_token)
message = @client.messages.create(
    body: "Hello from Ruby",
    to: "+447312525246",    # Replace with your phone number
    from: "+18588004049")  # Use this Magic Number for creating SMS

puts message.sid