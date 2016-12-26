module Web::Controllers::Urls
  class Index
    include Web::Action

    expose :urls

    def call(params)
      @urls = UrlRepository.new.for_token(current_token)
    end
  end
end
