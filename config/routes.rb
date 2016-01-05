Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
      resources :customers, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
      resources :items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
      resources :invoices, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
      resources :invoice_items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
      resources :transactions, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
