Rails.application.routes.draw do
  devise_for :accounts,:controllers => { :omniauth_callbacks => "account/omniauth_callbacks",registrations: "account/registrations",passwords: "account/passwords",sessions:'account/sessions' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :category_article,:article,:categorie,:accounts
  get "article/page/:page" => 'article#index'
  get "page/:page" => 'home#index'
  get "article/popularScript" => 'article#mostPopular' , as: 'popularpost'

end
