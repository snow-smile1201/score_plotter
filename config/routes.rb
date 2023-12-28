Rails.application.routes.draw do
  get 'results/index'
  get 'results/show'
  get 'students/index' => 'students#index'
  get 'students/show'
  get 'homes/top' => 'homes#top'
  post 'homes/top' => 'homes#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
