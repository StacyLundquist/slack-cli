require_relative './test_helper'
# Any tests involving a User should use the username SlackBot

describe 'User' do
  before do
    @user = User.new(
      name: 'Slackbot',
      slack_id: '10AB45FRE',
      real_name: 'Fakey McFaker',
      status_text: 'helllloooo',
      status_emoji: ':sunrise:'
    )
  end
  describe 'User instantiation' do
    it 'is an instance of user' do
      expect(@user).must_be_kind_of User
    end
  end

  describe 'self.get' do
    it 'returns list of users' do
      response = {}
      VCR.use_cassette('user_list') do
        response = User.get('https://slack.com/api/users.list', {token: ENV['SLACK_TOKEN']})
      end
      expect(response).must_be_kind_of HTTParty::Response
      expect(response['ok']).must_equal true
    end
    it 'raise an error when it fails to response(bad url/api)' do
      VCR.use_cassette('user_list') do
        expect { User.get('https://slack.com/api/users')}.must_raise SlackError
      end
    end
    describe 'self.list_all' do
      it 'returns a list of users' do
        VCR.use_cassette('user_list') do
          response = User.get('https://slack.com/api/users.list', {token: ENV['SLACK_TOKEN']})
          expect { response }.must_be_kind_of Array
        end
      end
    end
  end
end
