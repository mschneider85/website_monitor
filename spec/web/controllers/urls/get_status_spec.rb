require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/get_status'

describe Web::Controllers::Urls::Index do
  let(:action) { Web::Controllers::Urls::GetStatus.new }
  let(:repository) { UrlRepository.new }

  before do
    repository.clear
    repository.create(id: 1, title: 'google.de', address: 'http://www.google.de')
    repository.create(id: 2, title: 'google.de', address: 'http://www.loremipsumdolorsitamet.de')
  end

  describe 'with valid param and valid address' do
    let(:params) { Hash[id: 1] }

    it 'is successful if address exists' do
      response = action.call(params)
      response[0].must_equal 200
    end

    it 'renders json on responding address' do
      response = action.call(params)
      assert JSON.parse(response[2][0]).is_a?(Hash)
    end
  end

  describe 'with valid param and invalid address' do
    let(:params) { Hash[id: 2] }

    it 'renders json on non-responding address' do
      response = action.call(params)
      assert JSON.parse(response[2][0].to_s).is_a?(Hash)
    end
  end

  describe 'without param' do
    let(:params) { Hash[] }

    it 'render 404 if address doesnt exist' do
      response = action.call(params)
      response[0].must_equal 404
    end
  end
end
