require_relative './spec_helper'

RSpec.describe Localbitcoins::Client, :vcr do
  describe :initialize do
    let(:subject) { Localbitcoins::Client }
    
    context 'missing keys' do
      it 'should return a error message with missing hmac key' do
        expect{ subject.new(hmac_secret: 'test-secret') }.to raise_error(Localbitcoins::MissingKey)
      end

     it 'should return an error message with a missing hmac secret' do
       expect{ subject.new(hmac_key: 'test-key') }.to raise_error(Localbitcoins::MissingKey)
     end
    end
    
    context 'with hmac keys' do
      it 'should return an intialized client' do
        expect(subject.new(hmac_key: 'test-key', hmac_secret: 'test-secret').class).to eq(Localbitcoins::Client)
      end
    end
  end

  describe :account do
    describe :myself do
      context 'valid token' do
        it 'should return username and user url' do
          response = valid_client.myself
          body = JSON.parse(response.body, symbolize_names: true)[:data]
          expect(response.status).to eq(200)
          expect(body[:username]).to eq('test-user')
          expect(body[:url]).to eq('https://localbitcoins.com/p/test-user/')
        end
      end

      context 'invalid token' do
        it 'should return an error code and message' do
          response = invalid_client.myself
          error_body = JSON.parse(response.body, symbolize_names: true)[:error]
          expect(response.status).to eq(400)
          expect(error_body[:error_code]).to eq(41)
          expect(error_body[:message]).to eq('HMAC authentication key and signature was given, but they are invalid.')
        end
      end
    end

    describe '#dashboard' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end

    describe '#dashboard_released' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end

    describe '#dashboard_closed' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end

    describe '#notifications' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
  end

  describe :wallet do
    describe '#wallet' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
    describe '#wallet_balance' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
    describe '#wallet_address' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
    describe '#fees' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
    describe '#wallet_send' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
    describe '#wallet_send_pin' do
      it 'is' do
        pending('waiting to be implemented')
        expect(1).to be(1)
      end
    end
  end
end
