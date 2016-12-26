module Web::Controllers::Urls
  class Create
    include Web::Action

    expose :url
    expose :additional_messages

    params do
      required(:url).schema do
        required(:title).filled(:str?)
        required(:address).filled(:str?, format?: URI.regexp(%w(http https)))
      end
    end

    def call(params)
      params[:url][:token] = current_token
      @additional_messages = []

      if params.valid?
        @url = repository.find_by(address: params[:url][:address], token: current_token)
        unless @url.nil?
          @additional_messages << 'Address already exists'
          return self.status = 422
        end
        @url = UrlRepository.new.create(params[:url])
        redirect_to routes.urls_path
      else
        self.status = 422
      end

    rescue Hanami::Model::UniqueConstraintViolationError
      @additional_messages << 'Address already exists'
      self.status = 422
    end

    private

    def repository
      @repository ||= UrlRepository.new
    end
  end
end
