Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  resources :employees
  resources :departments
  resources :expenses do
    collection do
      get 'employee/:employee_id', to: 'expenses#expenses_by_employee', as: 'by_employee'
    end
  end
  resources :expense_reports do
    member do
      post 'approve_valid_expenses'
    end
  end
  resources :admins
  resources :comments

  # Defines the root path route ("/")
  # root "posts#index"
end
