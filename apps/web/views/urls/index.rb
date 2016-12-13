module Web::Views::Urls
  class Index
    include Web::View

    def current_site
      'urls'
    end
  end
end
