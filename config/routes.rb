Coursemaster::Application.routes.draw do
  get "admin/index"
  get "admin/courses"

  root :to => 'home#index'
  get 'home/index'
end
