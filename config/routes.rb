ScratchPad::Application.routes.draw do
  root 'notes#index'

  resources :notes, only: [:index, :create, :update, :destroy]

  resources :todo_lists, only: [] do
    resources :todo_items, only: [:destroy]
  end

  get '*any' => 'notes#index'
end
