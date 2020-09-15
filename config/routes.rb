# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'machines#index'

  resources :products do
    resources :molds, only: %i[new create show destroy]
  end

  resources :machines
end
