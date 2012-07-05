Facturadormx::Application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    resources :accounts
    resources :companies
    
    devise_for :users
    # override
    get "accounts/new" => "accounts#new", :as => "new_user_registration"
    
    get "dashboard/index" => 'dashboard#index'
    resources :people

    resources :line_items
    resources :items
    resources :invoices
    resources :organizations

    root :to => "dashboard#index"
    
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

end
