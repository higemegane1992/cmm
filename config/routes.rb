# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'logs#index'

  resources :logs, only: %i[index show]

  resources :conditions do
    collection do
      get 'search'
    end
  end

  resources :products do
    resources :molds, only: %i[new create show destroy]
  end

  resources :machines
end
