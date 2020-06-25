Rails.application.routes.draw do
  get '/', to: 'weather#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '*path', controller: 'application', action: 'render_404'
end
