Med::Application.routes.draw do

  root 'index#home'

  devise_for :users
  resources :users


  devise_scope :user do
    resources :med_tests
  end

  resources :med_test_statistics
  get 'index/home'

end
