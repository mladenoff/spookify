Rails.application.routes.draw do

  root to: 'static_pages#root'

  post "api/search", to: 'api/tracks#search', defaults: { format: :json }
  # delete "api/playlists/:playlist_id/follows", to: 'api/tracks#search', defaults: { format: :json }

  namespace :api, defaults: { format: :json } do
    resources :users, only: %i(create show) do
      resources :playlists, only: [:index]
    end
    resource :session, only: %i(create destroy)
    resources :tracks, only: [:index]
    resources :playlists, only: %i(create index show) do
      resources :playlistings, only: %i(create)
      resources :follows, only: %i(create destroy)
    end
  end

end
