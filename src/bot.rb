#!/usr/bin/env ruby

require 'discordrb'
require_relative 'commands/command'
require_relative 'config/config_wrapper'

config = CraftminConfig.config
bot = Discordrb::Bot.new(token: config.token)

bot =  Discordrb::Commands::CommandBot.new(token: config.token, prefix: config.prefix)
commands = CraftminCommands.new(bot)

bot.run
