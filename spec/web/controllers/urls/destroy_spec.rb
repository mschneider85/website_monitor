require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/destroy'

describe Web::Controllers::Urls::Destroy do
  token = SecureRandom.uuid
  let(:action) { Web::Controllers::Urls::Destroy.new }
  let(:repository) { UrlRepository.new }
  let(:params) { Hash[id: 1, token: token] }

  before do
    repository.clear
    repository.create(id: 1, title: 'google.de', address: 'http://www.google.de', token: token)
    repository.create(id: 2, title: 'google.de', address: 'http://www.loremipsumdolorsitamet.de', token: token)
  end

  after do
    UrlRepository.new.clear
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'destroys url' do
    action.call(params)
    repository.find(params[:id]).must_be_nil
  end
end
