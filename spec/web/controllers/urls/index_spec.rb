require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/index'

describe Web::Controllers::Urls::Index do
  let(:action) { Web::Controllers::Urls::Index.new }
  let(:params) { Hash[] }
  let(:repository) { UrlRepository.new }

  before do
    repository.clear

    @url = repository.create(title: 'google.de', address: 'http://www.google.de')
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all urls' do
    action.call(params)
    action.exposures[:urls].must_equal [@url]
  end
end
