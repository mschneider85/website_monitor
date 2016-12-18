module Web::Views::Urls
  class Index
    include Web::View

    def new_url_link
      url = routes.new_url_path

      link_to url, class: 'btn pull-right' do
        'New URL'
      end
    end

    def link_to_remove(string)
      confirmation_message = 'Do you really want to remove ' + string + '?'
      success_message = string + ' has been deleted.'

      link_to '#', method: :delete, class: 'remove', 'data-confirm' => confirmation_message, 'data-success' => success_message do
        i class: 'fa fa-times'
      end
    end
  end
end
