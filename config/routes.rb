Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: 'search#show'
        get '/find_all', to: 'search#index'
        get '/random', to: 'random#show'
        get '/:id/items', to: 'merchant_items#show'
        get '/:id/invoices', to: 'merchant_invoices#show'
        get '/most_revenue', to: 'most_revenue#show'
        get '/most_items', to: 'most_items#show'
        get '/revenue', to: 'revenue#show'
      end
      namespace :invoices do
        get '/:id/transactions', to: 'invoice_transactions#show'
        get '/:id/invoice_items', to: 'invoices_items#show'
        get '/:id/items', to: 'items_invoice#show'
        get '/:id/customer', to: 'customer_invoice#show'
        get '/:id/merchant', to: 'merchant_invoice#show'
      end
      namespace :items do
        get '/:id/invoice_items', to: 'item_invi#show'
        get '/:id/merchant', to: 'merch_item#show'
      end
      namespace :transactions do
        get '/:id/invoice', to: 'invoice_transaction#show'
      end
      resources :merchants, only: [:index, :show]
      resources :customers, only: [:index, :show]
      resources :items, only: [:index, :show]
      resources :transactions, only: [:index, :show]
      resources :invoices, only: [:index, :show]
      resources :invoice_items, only: [:index, :show]
    end
  end
end
