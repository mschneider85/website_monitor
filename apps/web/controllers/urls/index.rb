module Web::Controllers::Urls
  class Index
    include Web::Action

    expose :urls

    def call(params)
      @urls = UrlRepository.new.all
    end
  end
end
