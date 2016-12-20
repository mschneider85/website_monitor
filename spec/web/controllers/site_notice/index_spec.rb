require 'spec_helper'
require_relative '../../../../apps/web/controllers/site_notice/index'

describe Web::Controllers::SiteNotice::Index do
  let(:action) { Web::Controllers::SiteNotice::Index.new }
  let(:params) { Hash[] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end
end
