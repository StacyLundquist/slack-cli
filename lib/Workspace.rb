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
    # will call the details method of the previously selected user or channel
    if @selected.nil?
      puts "nothing selected"
    else
      return @selected.details
      endend

      def send_message
        if @selected.nil?
          puts "nothing selected"
        else
          return send_message(message)
        end
      end
    end
  end

