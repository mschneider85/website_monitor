require 'spec_helper'
require_relative '../../../../apps/web/controllers/home/authenticate'

describe Web::Controllers::Home::Authenticate do
  let(:action) { Web::Controllers::Home::Authenticate.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
