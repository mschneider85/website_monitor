require 'spec_helper'

describe UrlRepository do
  let(:token) { SecureRandom.uuid }

  before do
    @repository = UrlRepository.new
    @repository.clear

    @url = @repository.create(title: 'web.de', address: 'http://www.web.de', token: token)
    @another_url = @repository.create(title: 'google.de', address: 'http://www.google.de', token: token)
  end

  describe 'find_by' do
    it 'returns nil when called with wrong arguments' do
      assert_equal nil, @repository.find_by('this_is_a_test')
    end

    it 'returns record when called with valid argument' do
      assert_equal @url.to_h, @repository.find_by(title: 'web.de').to_h
    end

    it 'returns record when called with valid arguments' do
      assert_equal @url.to_h, @repository.find_by(title: 'web.de', address: 'http://www.web.de').to_h
    end
  end

  describe 'for_token' do
    it 'returns records for specified token' do
      refute_empty @repository.for_token(token)
    end

    it 'returns no records for new token' do
      assert_empty @repository.for_token(SecureRandom.uuid)
    end
  end
end
