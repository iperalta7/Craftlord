#!/usr/bin/env ruby

require 'discordrb'
require 'dotenv'
require_relative 'commands/command'

Dotenv.load('config.env')
discord_bot_token = ENV['DISCORD_BOT_TOKEN']
puts discord_bot_token
bot = Discordrb::Bot.new token: discord_bot_token

bot =  Discordrb::Commands::CommandBot.new token: discord_bot_token, prefix: '/'
commands = CraftminCommands.new(bot)

bot.run