require 'spec_helper'
require_relative '../../../../apps/web/views/robots/index'

describe Web::Views::Robots::Index do
  let(:exposures) { Hash[] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/robots/index.txt.erb') }
  let(:view)      { Web::Views::Robots::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'disallows robots' do
    rendered.must_include('User-Agent: *')
    rendered.must_include('Disallow: /')
  end
end
