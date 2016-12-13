require 'spec_helper'
require_relative '../../../../apps/web/controllers/urls/new'

describe Web::Controllers::Urls::New do
  let(:action) { Web::Controllers::Urls::New.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
