# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
get '/robots.:format', to: 'robots#index'
resources :urls, only: [:index, :new, :create, :destroy] do
  member do
    get 'get_status'
  end
end
resources :site_notice, only: :index
root to: 'home#index'
