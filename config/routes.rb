Rails.application.routes.draw do
 resources :apartments
 resources :tenants 
 resources :leases, only: [:create, :destroy]
end
