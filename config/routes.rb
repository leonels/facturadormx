Facturadormx::Application.routes.draw do

  scope ":locale", locale: /#{I18n.available_locales.join("|")}/ do

    resources :people
    get "dashboard/index" => 'dashboard#index'
    devise_for :users
    resources :line_items
    resources :items
    resources :invoices
    resources :organizations

    root :to => "dashboard#index", :as => 'dashboard'
    
  end
  match '*path', to: redirect("/#{I18n.default_locale}/%{path}"), constraints: lambda { |req| !req.path.starts_with? "/#{I18n.default_locale}/" }
  match '', to: redirect("/#{I18n.default_locale}")

end
