module Web::Views::Urls
  class Create
    include Web::View
    template 'urls/new'

    def current_site
      'urls'
    end
  end
end
