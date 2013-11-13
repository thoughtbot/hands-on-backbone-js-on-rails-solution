ScratchPad::Application.routes.draw do
  root 'notes#index'

  resources :notes, only: [:index, :create, :update, :destroy]

  get '*any' => 'notes#index'
end
