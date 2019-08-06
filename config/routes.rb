Rails.application.routes.draw do
  namespace :api do
    resources :files, only: :create
    get "files/:tag_search_query/:page", to: "files#show", as: "file"
  end
end
