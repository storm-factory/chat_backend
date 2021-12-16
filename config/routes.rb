Rails.application.routes.draw do
  devise_for :users

  resources :users do
      resources :chat_sessions
  end

  root to: 'welcome#index'
end
