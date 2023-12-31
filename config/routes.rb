Rails.application.routes.draw do
  root to: 'homes#top'
  post 'homes/top' => 'homes#create'
  resources :results, only: [:index, :show]
  resources :students, only: [:index, :show], param: :student_number, constraints: { student_number: /\d+/ }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
