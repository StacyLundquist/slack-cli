#!/usr/bin/env ruby
require_relative 'Workspace'
require 'terminal-table'
require 'table_print'
require 'dotenv'

def main
  Dotenv.load
  puts 'Welcome to the Ada Slack CLI!'
  workspace = Workspace.new

  options_table = [[1, 'List Users'], [2, 'List Channels'], [3, 'Select User'],
                   [4, 'Select Channel'], [5, 'Details'], [6, 'Send Message'], [7, 'QUIT']]
  input = nil
  until input == 'quit' || input == '7'
    options = Terminal::Table.new :title => 'What would you like to do?', :rows => options_table
    puts options

    case input = gets.chomp.downcase
    when '1', 'list users'
      tp workspace.users, :name, :real_name, :slack_id

    when '2', 'list channels'
      tp workspace.channels, :name, :topic, :member_count, :slack_id

    when '3', 'select user'
      puts 'Please enter a username or SlackID'
      wanted_user = gets.chomp
      if workspace.select_user(gets.chomp).nil?
        puts "We don't have #{wanted_user} as a user, try again?"
      else
        puts "enter details to see information about #{id}"
        puts "enter send message to send a message to #{id}"
      end

    when '4', 'select channel'
      puts 'Please enter a channel name or SlackID'
      wanted_channel = gets.chomp
      if workspace.select_channel(wanted_channel).nil?
        puts "We don't have #{wanted_channel} as a channel, try again?"
      else
        puts "enter details to see information about #{id}"
        puts "enter send message to send a message to #{id}"
      end

    when '5', 'details'
      puts workspace.show_details
      if workspace.selected.nil?
        puts 'Select a user or channel first...'
      else
        workspace.show_details
      end

    when '6', 'send message'
      puts 'What is your message: '
      message = gets.chomp
      if workspace.selected.nil?
        puts 'Select a user or channel first...'
      else
        workspace.send_message(message)
        puts 'Message sent!'
      end
    end
  end

puts 'Thank you for using the Ada Slack CLI'

end


main if __FILE__ == $PROGRAM_NAME