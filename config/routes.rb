Rails.application.routes.draw do
  resources :searches, only: [:index, :new, :create] do
    collection do
      get :autocomplete
    end
  end
  root 'searches#index'
  mount Searchjoy::Engine, at: "searchjoy"
end
