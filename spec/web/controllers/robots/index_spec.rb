require 'spec_helper'
require_relative '../../../../apps/web/controllers/robots/index'

describe Web::Controllers::Robots::Index do
  let(:action) { Web::Controllers::Robots::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
