require_relative './test_helper'


describe Recipient do
  describe Recipient.list_all do
    it 'raises an error if invoked directly (without subclassing' do
      expect { Recipient.list_all }.must_raise NotImplementedError
    end
  end
end