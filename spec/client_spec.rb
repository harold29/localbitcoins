require_relative './spec_helper'

RSpec.describe Localbitcoins::Client, :vcr do
  describe :account do
    describe :myself do
      it 'gets user data with a valid token' do
        # expect(valid_client.myself).to valid_response
      end
    end
  end
end
