module Web::Views
  module ActionName
    def self.included(view)
      view.class_eval do
        def action_name
          self.class.name.split('::').join(' ').downcase
        end
      end
    end
  end
end
