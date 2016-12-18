require 'spec_helper'
require_relative '../../../../apps/web/views/urls/index'

describe Web::Views::Urls::Index do
  let(:exposures) { Hash[urls: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/urls/index.html.erb') }
  let(:view)      { Web::Views::Urls::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #urls' do
    view.urls.must_equal exposures.fetch(:urls)
  end

  describe 'when there are no urls' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no urls yet.</p>')
    end
  end

  describe 'when there are urls' do
    let(:url1)     { Url.new(id: 1, title: 'google.de', address: 'http://www.google.de') }
    let(:url2)     { Url.new(id: 2, ttitle: 'web.de', address: 'http://www.web.de') }
    let(:exposures) { Hash[urls: [url1, url2]] }

    it 'lists them all' do
      rendered.scan(/class="url"/).count.must_equal 2
      rendered.must_include('google.de')
      rendered.must_include('web.de')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no urls yet.</p>')
    end
  end
end
