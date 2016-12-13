# apps/web/views/home/index.rb
module Web::Views::Home
  class Index
    include Web::View

    def current_site
      'home'
    end
  end
end
