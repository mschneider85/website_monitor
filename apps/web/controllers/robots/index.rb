module Web::Controllers::Robots
  class Index
    include Web::Action
    accept :text

    def call(_params)
      self.format = :txt
    end
  end
end
