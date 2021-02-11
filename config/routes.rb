Rails.application.routes.draw do
  # devise
  devise_for :users,
  controllers: {
    registrations: 'users/registrations'
  }
end
