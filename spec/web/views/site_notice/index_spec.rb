require 'spec_helper'
require_relative '../../../../apps/web/views/site_notice/index'

describe Web::Views::SiteNotice::Index do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/site_notice/index.html.erb') }
  let(:view)      { Web::Views::SiteNotice::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'shows legal discosure and disclaimer' do
    rendered.must_include('Legal Disclosure')
    rendered.must_include('Disclaimer')
  end
end
