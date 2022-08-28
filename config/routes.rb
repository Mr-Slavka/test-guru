  Rails.application.routes.draw do

    root 'tests#index'

    get :signup, to: 'users#new'
    get :login, to: 'sessions#new'
    get :logout, to: 'sessions#destroy'

    resources :users, only: :create
    resources :sessions, only: %i[create destroy]

    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end

      post :start, on: :member
    end

    resources :test_passages, only: %i[show update] do
      member do
        get :result
      end
    end
  end

