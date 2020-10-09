require_relative 'channel'
require_relative 'user'

class Workspace

  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
    @selected = nil
  end

  def select_channel(wanted_channel)
    if @channels.include?(wanted_channel)
      @selected = wanted_channel
      return @selected.name
    else
      return "We don't have #{wanted_channel} as a channel, try again?"
    end
  end


  def select_user(wanted_user)
    if @users.include?(wanted_user)
      @selected = wanted_user
      return @selected.name
    else
      return "We don't have #{wanted_user} as a user, try again?"
    end
  end


  def show_details
    if @selected.nil?
      puts 'Select a user or channel first...'
    else
      return @selected.details
    end
  end

  def send_message(message)
    if @selected.nil?
      puts 'Select a user or channel first...'
    else
      return send_message(message)
    end
  end
end


