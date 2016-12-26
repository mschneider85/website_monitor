require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/create'

describe Web::Controllers::Urls::Create do
  let(:action) { Web::Controllers::Urls::Create.new }

  after do
    UrlRepository.new.clear
  end

  describe 'with valid params' do
    let(:params) { Hash[url: { title: 'google.de', address: 'http://www.google.de' }] }

    it 'creates a new url' do
      action.call(params)
      action.url.id.wont_be_nil
    end

    it 'redirects the user to the urls listing' do
      response = action.call(params)

      response[0].must_equal 302
      response[1]['Location'].must_equal '/urls'
    end
  end

  describe 'with empty params' do
    let(:params) { Hash[url: {}] }

    it 're-renders the urls#new view' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'sets errors attribute accordingly' do
      response = action.call(params)
      response[0].must_equal 422

      action.params.errors[:url][:title].must_equal ['is missing']
      action.params.errors[:url][:address].must_equal ['is missing']
    end
  end

  describe 'with wrong url format' do
    let(:params) { Hash[url: { title: 'Test', address: 'test' }] }

    it 're-renders the urls#new view' do
      response = action.call(params)
      response[0].must_equal 422
    end

    it 'sets errors attribute accordingly' do
      response = action.call(params)
      response[0].must_equal 422

      action.params.errors[:url][:address].must_equal ['is in invalid format']
    end
  end

  describe 'existing address' do
    let(:params) { Hash[url: { title: 'Google', address: 'http://www.google.de' }] }

    it 're-renders the urls#new view' do
      action.call(params)
      response = action.call(params)
      response[0].must_equal 422
    end
  end
end
