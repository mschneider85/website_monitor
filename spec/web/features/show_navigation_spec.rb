require 'features_helper'

describe 'Show navigation' do
  it 'has nav ul' do
    visit '/'
    page.body.must_include('<ul class="navigation">')
  end
end
