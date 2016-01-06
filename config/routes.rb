Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :merchants, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
          get 'most_revenue', action: 'most_revenue'
          get 'most_items',   action: 'most_items'
          get 'revenue',      action: 'all_revenue'
        end

        member do
          get :items
          get :invoices
          get :revenue
          get :revenue, action: 'single_revenue'
          get :customers_with_pending_invoices
          get :favorite_customer
        end
      end
      resources :customers, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get :invoices
          get :transactions
          get :favorite_merchant
        end
      end
      resources :items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
          get 'most_revenue', action: 'most_revenue'
          get 'most_items',   action: 'most_items'
        end

        member do
          get :invoice_items
          get :merchant
          get :best_day
        end
      end
      resources :invoices, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get :transactions
          get :invoice_items
          get :items
          get :customer
          get :merchant
        end
      end
      resources :invoice_items, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get :invoice
          get :item
        end
      end
      resources :transactions, except: [:new, :edit], defaults: { format: :json } do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end

        member do
          get :invoice
        end
      end
    end
  end
end
