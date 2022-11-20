require "telegram/bot"
require "dotenv/load"
require "./config/environment"

class TelegramBot
  attr_accessor :bot

  def initialize
    @bot = Telegram::Bot::Client.new("5463791542:AAEGQdGAQZ3XtFXMLmt1AD5LKX-aHrIyuTk")
  end

  def start_bot
    @bot.run do |bot|
      bot.listen do |message|
        case message
        when Telegram::Bot::Types::Message
          unless message.text.nil?
            case message.text
            when "/start"
              bot.api.send_message(chat_id: message.chat.id, text: "lol suup")
            else
              bot.api.send_message(chat_id: message.chat.id, text: "idk know.")
            end
          end
        end
      end
    end
  end
end

TelegramBot.new.start_bot
