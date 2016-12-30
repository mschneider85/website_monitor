module Web::Controllers::Home
  class Authenticate
    include Web::Action

    params do
      required(:token).filled(:str?, format?: /[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}/)
    end

    def call(params)
      if params.valid? && urls_with_token.any?
        session[:token] = params[:token]
        status 200, 'changed token'
      else
        status 422, 'not found'
      end
    end

    private

    def urls_with_token
      UrlRepository.new.urls.where(token: params[:token]).to_a
    end

    def verify_csrf_token?
      false
    end
  end
end
