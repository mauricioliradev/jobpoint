Rails.application.routes.draw do
  # devise
  devise_for :users,
  controllers: {
    registrations: 'users/registrations'
  },
  path_names: {
    sign_out:     :sair,
    sign_in:      :login,
    password:     :secret,
    confirmation: :verification,
    unlock:       :unblock,
    registration: :'minha-conta',
    sign_up:      :'cadastre-se',
    edit:         :'editar-perfil'
  }
  resources :registers
  root 'pages#home'
end
