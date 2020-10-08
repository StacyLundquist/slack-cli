#!/usr/bin/env ruby
require_relative 'Workspace'
require 'terminal-table'


def main
  puts 'Welcome to the Ada Slack CLI!'
  workspace = Workspace.new


  options_table = [[1, 'List Users'], [2, 'List Channels'], [3, 'Select User'],
                   [4, 'Select Channel'], [5, 'Details'], [6, 'Send Message'], [7, 'QUIT']]
  input = nil
  until input == 'quit' || input == '7'
    options = Terminal::Table.new :title => 'What would you like to do?', :rows => options_table
    puts options
    input = gets.chomp.downcase

    case input.downcase
    when '1', 'list users'
      tp Workspace.users # should include username, realname, and slackID
    when '2', 'list channels'
      tp Workspace.channels # should include channelname, topic, member count, and slackID
    when '3', 'select user'
      puts 'Please enter a username or SlackID'
      user = gets.chomp
      if Workspace.select_channel(user).nil?
        puts "We don't have #{user} as a user, try again?"
      end
    when '4', 'select channel'
      puts 'Please enter a channel name or SlackID'
      channel = gets.chomp
      if Workspace.select_channel(channel).nil?
        puts "We don't have a #{channel} channel, try again?"
      end
    when '5', 'details'


    when '6', 'send message'
      
    end
  end
  

  puts 'Thank you for using the Ada Slack CLI'
end

main if __FILE__ == $PROGRAM_NAME