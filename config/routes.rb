Rails.application.routes.draw do
  resource :root do
    get :hoge, on: :collection
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
