Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :client do
        resources :trees
        resources :invoices
        resources :plans
        resources :currencies
        resources :sessions do
          collection do
            post :verify
          end
        end
        resources :captchas
        resources :users do
          get :authenticator
          patch :update_authenticator
        end
        resources :pass_recoveries
        resources :vaults
        resources :server_times
        resources :subscriptions
        resources :rewards
        resources :withdrawals do
          collection do
            patch 'confirm/:uuid', to: 'withdrawals#confirm'
            post 'resend_confirmation_email/:uuid', to: 'withdrawals#resend_confirmation_email'
          end
        end

        scope 'invoices' do
          post 'activation', to: 'invoices#update'
        end

        namespace 'stats' do
          resources :pies
        end

      end


      namespace :admin do
        resources :users do
          collection do
            get :usernames
          end
        end
        resources :invoices
        resources :temp_users
        resources :courses
        resources :units
        resources :sessions
        resources 'withdrawals'
        resources 'points'
        resources :vaults
        resources :tools
        resources :courses do
          resources :units
        end

        resources :units, only:[] do
          resources :lessons
        end

        namespace 'reports' do
          resources :subscriptions
          resources :users
          get 'withdrawals', to: 'withdrawals#index'
        end

        namespace :blockio_wallets do
          get :get_current_price
          get :withdraw
          get :get_network_fee_estimate
        end
      end
    end
  end
end
