require 'spec_helper'
require_relative '../../../../apps/web/views/urls/new'

class NewUrlParams < Hanami::Action::Params
  params do
    required(:url).schema do
      required(:title).filled(:str?)
      required(:address).filled(:str?, format?: URI.regexp(%w(http https)))
    end
  end
end

describe Web::Views::Urls::New do
  let(:params)    { NewUrlParams.new(url: {}) }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/urls/new.html.erb') }
  let(:view)      { Web::Views::Urls::New.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'displays list of errors when params contains errors' do
    params.valid? # trigger validations

    rendered.must_include('There was a problem with your submission')
    rendered.must_include('Title is missing')
    rendered.must_include('Address is missing')
  end
end
