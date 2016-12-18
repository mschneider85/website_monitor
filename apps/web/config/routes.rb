# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
resources :urls, only: [:index, :new, :create, :destroy] do
  member do
    get 'get_status'
  end
end
root to: 'home#index'
