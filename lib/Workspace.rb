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
      return @selected.name
  end


  def select_user(wanted_user)
      return @selected.user
  end


  def show_details
      return @selected.details
  end

  def send_message(message)
      return send_message(message)
  end
end


