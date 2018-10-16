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
    post "roles" => "roles#create"
    patch "roles/:id" => "roles#update"

    get "performances" => "performances#index"
    get "performances/:id" => "performances#show"
    post "performances" => "performances#create"
    patch "performances/:id" => "performances#update"

    post "/members" => "members#create"

    get "carted_tickets" => "carted_tickets#index"
    get "carted_tickets/:id" => "carted_tickets#show"
    post "carted_tickets" => "carted_tickets#create"
    patch "carted_tickets/:id" => "carted_tickets#update"
    delete "carted_tickets/:id" => "carted_tickets#destroy"

    get "orders/:id" => "orders#show"
    post "orders" => "orders#create"

  end

end
