Rails.application.routes.draw do
  resources :employees do
    resources :schedules do
      resources :work_days
    end
  end

  root 'employees#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
