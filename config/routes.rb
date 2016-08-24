Rails.application.routes.draw do
  get 'tickets/index'

  get 'tickets/show'

  get 'tickets/new'

  get 'tickets/create'

  get 'tickets/edit'

  get 'tickets/delete'

  get 'tickets/update'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
