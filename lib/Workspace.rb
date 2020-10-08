
require_relative 'channel'
require_relative 'user'



class Workspace

  # we should create a method that give users related info
  # we need to use this method in slack.rb
  # attributes: users, channels, selected
  # methods: select_channel, select_user, show_details, send_message

  attr_reader :users, :channels, :selected

  def initialize
    @users = User.list_all
    @channels = Channel.list_all
  end

  def select_channel()
    # @channels.each do |channel|

  end


  def select_user()
    # @users.each do |user|

  end


  def show_details
    # will call the details method of the previously selected user or channel
  end

  def send_message

  end
end

