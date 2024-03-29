Rails.application.routes.draw do
  get 'searchs/search'
  namespace :admin do
    # order
    resources :orders, only: [:show, :update, :index]

    # customer
    resources :customers, only: [:index, :show, :edit, :update]
    get 'customers/orders/:id' => 'customers#orders'

    # genre
    resources :genres, only: [:index, :create, :edit, :update]

    # item
    resources :items, except: [:destroy]

    # order_detail
    resources :order_details, only: [:update, :index]

    # home
    root to: 'homes#top'
  end

  scope module: :public do
    # destination
    resources :destinations, except: [:new, :show]

    # order
    get 'orders/complete' => 'orders#complete'
    resources :orders, only: [:index, :new, :create, :show]
    post 'orders/confirm'


    # cart_item
    resources :cart_items, only: [:index, :update, :create, :destroy]
    delete 'cart_items' => 'cart_items#destroy_all'

    # customer
    get 'customers/mypage' => 'customers#show'
    get 'customers/information/edit' => 'customers#edit'
    patch 'customers/information' => 'customers#update'
    get 'customers/soft_delete' => 'customers#soft_delete'
    patch 'customers/drop' => 'customers#drop'

    # item
    resources :items, only: [:index, :show]

    # home
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end