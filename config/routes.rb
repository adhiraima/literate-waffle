Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  put '/drivers/{id}/location', to: 'drivers#update_position'
  get '/drivers', to: 'drivers#list'
end
