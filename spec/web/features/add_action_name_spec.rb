require 'features_helper'

describe 'action_name' do
  it 'appends to body' do
    visit '/'
    assert page.has_css?('body.web.views.home.index')
  end

  it 'changes after navigating' do
    visit '/urls'
    assert page.has_css?('body.web.views.urls.index')
  end
end
