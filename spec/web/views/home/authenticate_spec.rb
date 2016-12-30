require 'spec_helper'
require_relative '../../../../apps/web/views/home/authenticate'

describe Web::Views::Home::Authenticate do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/home/authenticate.html.erb') }
  let(:view)      { Web::Views::Home::Authenticate.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
