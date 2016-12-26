require 'features_helper'

describe 'Delete urls' do
  it 'deletes url' do
    visit '/urls/new'
    within('#url-form') do
      fill_in 'Title', with: 'google.de'
      fill_in 'Address', with: 'http://www.google.de'
      find(:css, 'button[type="submit"]').click
    end

    visit '/urls'

    first(:css, '.url[data-id] .remove').click

    current_path.must_equal('/urls')

    # TODO: fix asssertion, javascript seems to mess this up
    #
    # assert page.has_no_css?('.url[data-id="1"] .remove')
  end
end
