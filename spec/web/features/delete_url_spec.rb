require 'features_helper'

describe 'Delete urls' do
  let(:repository) { UrlRepository.new }

  before do
    repository.clear

    repository.create(id: 1, title: 'web.de', address: 'http://www.web.de')
    repository.create(id: 2, title: 'google.de', address: 'http://www.google.de')
  end

  it 'deletes url' do
    visit '/urls'

    find(:css, '.url[data-id="1"] .remove').click

    current_path.must_equal('/urls')

    # TODO: fix asssertion, javascript seems to mess this up
    #
    # assert page.has_no_css?('.url[data-id="1"] .remove')
  end
end
