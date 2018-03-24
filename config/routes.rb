Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch "pokemon/capture", to: "pokemons#capture", as: "capture"
  patch "trainer/damage", to: "trainers#damage", as: "damage"
  resources :pokemons




end