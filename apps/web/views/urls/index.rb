module Web::Views::Urls
  class Index
    include Web::View

    def new_url_link
      url = routes.new_url_path

      link_to url, class: 'btn pull-right' do
        'New URL'
      end
    end
  end
end
