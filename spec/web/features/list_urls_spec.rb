require 'features_helper'

describe 'List urls' do
  let(:repository) { UrlRepository.new }
  before do
    repository.clear

    repository.create(title: 'web.de', address: 'http://www.web.de')
    repository.create(title: 'google.de', address: 'http://www.google.de')
  end

  it 'displays each url on the page' do
    visit '/urls'

    within '#urls' do
      assert page.has_css?('.url', count: 2), 'Expected to find 2 urls'
    end
  end
end
