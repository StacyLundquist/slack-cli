#!/usr/bin/env ruby
require_relative 'Workspace'
require 'terminal-table'
require 'table_print'
require 'dotenv'

def main
  Dotenv.load
  puts 'Welcome to the Ada Slack CLI!'
  workspace = Workspace.new

  tp.set workspace.users, :name, :real_name, :slack_id
  tp.set workspace.channels, :name, :topic, :member_count, :slack_id

  options_table = [[1, 'List Users'], [2, 'List Channels'], [3, 'Select User'],
                   [4, 'Select Channel'], [5, 'Details'], [6, 'Send Message'], [7, 'QUIT']]
  input = nil
  until input == 'quit' || input == '7'
    options = Terminal::Table.new :title => 'What would you like to do?', :rows => options_table
    puts options
    input = gets.chomp.downcase

    case options_list
    when '1', 'list users'
      tp workspace.users
    when '2', 'list channels'
      tp workspace.channels
    when '3', 'select user'
      puts 'Please enter a username or SlackID'
      user = gets.chomp
      if workspace.select_channel(user).nil?
        puts "We don't have #{user} as a user, try again?"
      end
    when '4', 'select channel'
      puts 'Please enter a channel name or SlackID'
      channel = gets.chomp
      if workspace.select_channel(channel).nil?
        puts "We don't have a #{channel} channel, try again?"
      end
    when '5', 'details'


    when '6', 'send message'
      
    end
  end
  

  puts 'Thank you for using the Ada Slack CLI'
end

main if __FILE__ == $PROGRAM_NAME