#!/usr/bin/env ruby
require 'open3'

class CraftminCommands
  def initialize(bot)
    @bot = bot
    @config = CraftminConfig.config
    set_up
  end

  def log_command
    @bot.command :log do |event|
        log_file_path = "#{@config.server_dir}/server.log"
        log_content = read_last_lines(log_file_path, 10)
        unless @pinned_message_id
          message = event.send_message("```\n#{log_content}\n```")
          message.pin
          @pinned_message_id = message.id
          return 
        end

        begin
          message = @bot.channel(event.channel.id).message(@pinned_message_id)
          message.edit("```\n#{log_content}\n```")
          rescue Discordrb::Errors::NoPermission
            event.send_message("Error: Unable to edit the pinned message due to insufficient permissions.")
          rescue Discordrb::Errors::NotFound
            event.send_message("Error: Pinned message not found.")
        end
      end
  end

  def read_last_lines(file_path, n)
    lines = File.readlines(file_path)
    lines.last(n).join
  rescue Errno::ENOENT
    "Log file not found."
  end

    def set_up
        log_command
    end
end
