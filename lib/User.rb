#needs to be child of recipient
# Attributes: real_name, status_text, status_emoji
# methods: details, self.list_all
require 'httparty'
require_relative 'recipient'

class User < Recipient
  attr_reader :real_name, :status_text, :status_emoji

  def initialize(name:, slack_id:, real_name:, status_text:, status_emoji:)
    super(name: name, slack_id: slack_id)
    @real_name = real_name
    @status_text = status_text
    @status_emoji = status_emoji
  end


  def details
    #prints info for currently selected user, if not, should let user know and return to main command prompt

  end

  def self.list_all
    users = []
    response = Recipient.get('https://slack.com/api/users.list', {token: ENV['SLACK_TOKEN']})
    if response.code != 200 || response["ok"] == false
      raise APIError, "there is a problem: #{response['error']}"
    end

    response["members"].each do |user|
      new_user = User.new(
          name: user["name"],
          slack_id: user["id"],
          real_name: user["profile"]["real_name"],
          status_text: user["profile"]["status_text"],
          status_emoji: user["profile"]["status_emoji"]
      )

      users << new_user

    end
    return users
  end

end
