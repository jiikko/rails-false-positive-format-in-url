Rails.application.routes.draw do
  resources :roots, format: false, constraints: { id: /.*/ }
end
