require_relative './test_helper'

# Any tests involving a Channel should use the #random channel
# describe "Channel class" do
#   before do
#     @channel = Channel.new(
#         name: "animals",
#         slack_id: "D45HG123E",
#         topic:{},
#         member_count: "12"
#     )
#   end

describe 'channel' do
  describe 'channel instantiation' do
    it 'is an instance of user' do
      new_channel = Channel.new(random)
      expect{ new_channel }.must_be_kind_of Channel
    end
  end

  describe 'self.get' do
    it 'return a list of channels' do
      response = {}
      vcr.use_cassette('channel_list') do
        response = Channel.get('https://slack.com/api/conversations.list',
                               {token: ENV['USER_SLACK_TOKEN']})
      end
      expect(response).must_be_kind_of HTTParty::Response
      expect(response['ok']).must_equal true
    end
    it 'raise an error when it fails to response(bad url/api)' do
      vcr.use_cassette('channel_list') do
        expect { Channel.get('https://slack.com/api/convo.list',
                             {token: ENV['USER_SLACK_TOKEN']}) }.must_raise SlackError
      end
    end
  end

  describe 'self.list_all' do
    it 'returns a list of channels' do
      vcr.use_cassette('channel_list') do
        channels = Channel.list_all
        expect { channels }.must_be_kind_of Array
      end
    end
  end

end


