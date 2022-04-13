Rails.application.routes.draw do
  devise_for :admins
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  scope "(:locale)", locale: /en|vi/ do
    devise_for :users
    root "static_pages#home"
    as :user do
      get "signin" => "devise/sessions#new"
      post "signin" => "devise/sessions#create"
      delete "signout" => "devise/sessions#destroy"
    end

    resources :events do
      resources :tasks do
        collection do
          get :change_time
        end
      end
    end

  end
end
