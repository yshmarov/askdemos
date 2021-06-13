require "constraints/subdomain_required"

Rails.application.routes.draw do
  root 'accounts#index'
  constraints(SubdomainRequired) do
     scope module: "accounts" do
       root "posts#index", as: :account_root
       resources :posts
     end
  end

  resources :accounts, only: [:index, :new, :create]

  get 'static_public/landing_page'
end
