require 'features_helper'

describe 'action_name' do
  it 'appends to body' do
    visit '/'
    assert page.has_css?('body.web.views.home.index')
  end
end
