Rails.application.routes.draw do
  namespace :api do
    get "/404", to: "errors#not_found"
    get "/500", to: "errors#internal_server_error"

    resources :files, only: :create
    get "files/:tag_search_query/:page", to: "files#show", as: "file"
  end
end
