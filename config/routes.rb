Rails.application.routes.draw do
  devise_for :users
	root to: "articles#index"

	resources :articles do 
		resources :comments
	end

	require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
