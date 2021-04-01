Rails.application.routes.draw do
  # http://localhost:3000/roots/aaaaaaaaa.gif でアクセスするとき
  ## ActionController::UnknownFormat が起きる
  resources :roots, format: false, constraints: { id: /([^\/])+/ }

  ## ActionController::UnknownFormat が起きる
  # resources :roots, format: false, constraints: { id: /.+/ }

  ## matchしない
  # resources :roots, format: false

  # resources :roots, format: false, constraints: { id: /.+/ }
end
