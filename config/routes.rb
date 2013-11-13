ScratchPad::Application.routes.draw do
  root 'notes#index'

  resources :notes, only: [:index, :show]
end
