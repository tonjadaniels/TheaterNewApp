Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"

  namespace :api do

    get "productions" => "productions#index"

    get "professionals" => "professionals#index"

    get "roles" => "roles#index"

    get "performances" => "performances#index"
    
  end
end
