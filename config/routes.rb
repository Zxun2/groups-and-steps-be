Rails.application.routes.draw do
  # In our route definition, we’re creating todo resource with a nested items 
  # resource. This enforces the 1:m (one to many) associations at the routing level.
  resources :todos do
    resources :items
  end
end