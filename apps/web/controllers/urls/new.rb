module Web::Controllers::Urls
  class New
    include Web::Action

    expose :additional_messages

    def call(params)
      @additional_messages = []
    end
  end
end
