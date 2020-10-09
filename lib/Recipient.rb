require 'httparty'
class SlackError < StandardError; end

class Recipient
  CHANNEL_LIST_URL = 'https://slack.com/api/conversations.list'
  USER_LIST_URL = 'https://slack.com/api/users.list'
  MESSAGE_LIST_URL = 'https://slack.com/api/chat.postMessage'

  attr_reader :slack_id, :name

  def initialize(slack_id:, name:)
    @slack_id = slack_id
    @name = name
  end


  def send_message(message)
    response = HTTParty.post(MESSAGE_LIST, body: {
      token: ENV['SLACK_TOKEN'],
      text: message,
      channel: @slack_id
  })
    unless response['ok'] == true
      raise SlackError, "API call failed with reason #{response['error']}"
    end
    return true
  end


  def self.get(url, params)
    response = HTTParty.get(url, query: params)

    until response['ok']
      raise SlackError, "API call failed with code #{response.code} and reason #{response['reason']}"
    end

    return response
  end

  def details
    raise NotImplementedError, 'Implement me in a child class!'
  end

  def self.list_all
    raise NotImplementedError, 'Implement me in a child class!'
  end

end

