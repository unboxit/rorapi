# frozen_string_literal: true

Rails.application.routes.draw do
  resources :categories, except: %i[new edit]
  resources :brands, except: %i[new edit]
  resources :products, except: %i[new edit]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
