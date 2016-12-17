module Web::Controllers::Urls
  class GetStatus
    include Web::Action

    def call(params)
      @url = UrlRepository.new.find(params[:id])
      return self.status = 404 unless @url
      self.body = JSON.generate(@url.status)
    end
  end
end
