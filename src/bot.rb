require 'discordrb'
require 'dotenv'

Dotenv.load
discord_bot_token = ENV['DISCORD_BOT_TOKEN']
puts discord_bot_token
bot = Discordrb::Bot.new token: discord_bot_token

bot.message(content: 'Ping!') do |event|
  event.respond 'Pong!'
end

bot.run