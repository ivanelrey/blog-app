Rails.application.routes.draw do
  devise_for :users
	root to: "articles#index"

	resources :articles do 
		resources :comments
	end

	mount ActionCable.server => '/cable'

	require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
