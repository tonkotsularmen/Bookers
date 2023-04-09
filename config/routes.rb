Rails.application.routes.draw do
  get 'index' => 'books#index'
  post 'books' => 'books#create'
  get 'show' => 'books#show'
  get 'books/edit'
  get 'top' => 'homes#top'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
