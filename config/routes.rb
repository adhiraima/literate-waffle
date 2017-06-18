Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  PUT '/drivers/{id}/location', to: 'drivers#update_position' 
  GET '/drivers'. to: 'drivers#fetch'
end
