module Web::Controllers::Urls
  class Create
    include Web::Action

    expose :url

    params do
      required(:url).schema do
        required(:title).filled(:str?)
        required(:address).filled(:str?, format?: URI.regexp(%w(http https)))
      end
    end

    def call(params)
      if params.valid?
        @url = UrlRepository.new.create(params[:url])

        redirect_to routes.urls_path
      else
        @errors = params.error_messages
        self.status = 422
      end
    end
  end
end
