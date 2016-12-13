require 'spec_helper'

describe Url do
  it 'can be initialised with attributes' do
    url = Url.new(title: 'www.google.de')
    url.title.must_equal 'www.google.de'
  end
end
