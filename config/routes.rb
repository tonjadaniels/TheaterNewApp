Rails.application.routes.draw do
  post 'member_token' => 'member_token#create'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :api do

    get "productions" => "productions#index"
    get "productions/:id" => "productions#show"

    get "professionals" => "professionals#index"
    get "professionals/:id" => "professionals#show"

    get "roles" => "roles#index"
    get "roles/:id" => "roles#show"

    get "performances" => "performances#index"
    get "performances/:id" => "performances#show"

    post "/members" => "members#create"

  end

end
