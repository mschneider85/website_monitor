module Web::Controllers::Urls
  class Destroy
    include Web::Action

    def call(params)
      repository = UrlRepository.new

      @url = repository.find(params[:id])
      return self.status = 404 unless @url
      repository.delete(@url.id)
      self.status = 200
    end
  end
end
