require 'spec_helper'

describe Url do
  it 'can be initialised with attributes' do
    url = Url.new(title: 'Google', address: 'http://www.google.de')
    url.title.must_equal 'Google'
  end
end
