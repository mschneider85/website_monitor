require 'features_helper'

describe 'Urls' do
  it 'displays list of errors when params contains errors' do
    visit '/urls/new'

    within 'form#url-form' do
      click_button 'Create'
    end

    current_path.must_equal('/urls')

    assert page.has_content?('There was a problem with your submission')
    assert page.has_content?('Title must be filled')
    assert page.has_content?('Address must be filled')
  end

  it 'redirects to urls index after submission' do
    visit '/urls/new'

    within 'form#url-form' do
      fill_in('Title', with: 'Test')
      fill_in('Address', with: 'https://www.google.de')
      click_button 'Create'
    end

    current_path.must_equal('/urls')

    assert page.has_content?('Tracked Websites')
  end
end
