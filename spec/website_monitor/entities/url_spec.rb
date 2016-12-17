require 'spec_helper'

describe Url do
  it 'can be initialised with attributes' do
    url = Url.new(title: 'Google', address: 'http://www.google.de')
    url.title.must_equal 'Google'
  end

  describe 'status' do
    url = Url.new(title: 'Google', address: 'http://www.google.de')

    it 'returns a hash with two keys' do
      url.status.must_be_kind_of(Hash)
      url.status.keys.size.must_equal 2
    end

    it 'returns valid status' do
      assert [:online, :duration].include?(url.status.keys.first)
    end

    it 'returns valid duration' do
      url.status[:duration].to_f.must_be :>=, 0
    end
  end
end
