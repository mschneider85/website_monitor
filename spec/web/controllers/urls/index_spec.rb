require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/index'

describe Web::Controllers::Urls::Index do
  let(:token) { SecureRandom.uuid }
  let(:action) { Web::Controllers::Urls::Index.new }
  let(:params) { Hash[] }
  let(:repository) { UrlRepository.new }

  before do
    repository.clear

    @url = repository.create(title: 'google.de', address: 'http://www.google.de', token: token)
    @another_url = repository.create(title: 'web.de', address: 'http://www.web.de', token: SecureRandom.uuid)
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all urls dependent on the current_token' do
    action.stub(:current_token, token) do
      action.call(params)
    end
    action.exposures[:urls].map(&:address).must_equal [@url.address]
  end
end
