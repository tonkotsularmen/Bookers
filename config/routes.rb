Rails.application.routes.draw do
  get 'index' => 'books#index'
  post 'index' => 'books#create'
  get 'books/:id' => 'books#show', as: 'book'
  get 'edit' => 'books#edit'
  get 'top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
