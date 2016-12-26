require 'features_helper'

describe 'List urls' do
  before do
    visit '/urls/new'
    within('#url-form') do
      fill_in 'Title', with: 'google.de'
      fill_in 'Address', with: 'http://www.google.de'
      find(:css, 'button[type="submit"]').click
    end

    visit '/urls/new'
    within('#url-form') do
      fill_in 'Title', with: 'web.de'
      fill_in 'Address', with: 'http://www.web.de'
      find(:css, 'button[type="submit"]').click
    end
  end

  it 'displays each url on the page' do
    visit '/urls'

    within '#urls' do
      assert page.has_css?('.url', count: 2), 'Expected to find 2 urls'
    end
  end
end
