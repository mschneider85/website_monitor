module Web
  module Authentication
    def self.included(action)
      action.class_eval do
        before :set_token!
        expose :current_token
      end
    end

    private

    def set_token!
      unless token_set?
        loop do
          session[:token] = SecureRandom.uuid
          break unless repository.for_token(session[:token]).any?
        end
      end
    end

    def token_set?
      !current_token.nil?
    end

    def current_token
      @current_token ||= session[:token]
    end

    def repository
      @repository ||= UrlRepository.new
    end
  end
end
