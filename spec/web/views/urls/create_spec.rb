require 'spec_helper'
require_relative '../../../../apps/web/views/urls/create'

describe Web::Views::Urls::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/urls/create.html.erb') }
  let(:view)      { Web::Views::Urls::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
