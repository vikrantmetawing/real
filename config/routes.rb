Realstate::Application.routes.draw do
 match "/" => "real#fst"
 get "real/home"
  get"real/contact"
  get"real/logout"
  get"real/admin_property_view"
  get"real/homesearch"
   match ":id/previewhome/" => "real#previewhome"
    match ":id/listing/" => "real#listing"
   match ":id/logout/" => "real#logout"
   match ":id/s/" => "real#s"
    match ":id/admin_home/" => "real#admin_home"
     match ":id/adminhome_edit/" => "real#adminhome_edit"
   match ":id/changepwd/" => "real#changepwd"
   match ":id/contaview/" => "real#contaview"
    match ":id/login/" => "real#login"
    match ":id/admin/" => "real#admin"
  match ":id/admin_property_view/" => "real#admin_property_view"
   match ":id/contact/" => "real#contact"
  match ":id/userlogin/" => "real#userlogin"
   match ":id/userlogout/" => "real#userlogout"
   match ":id/userchangepwd/" => "real#userchangepwd"
   match ":id/homesearch/" => "real#homesearch"
   match ":id/storyview/" => "real#storyview"
   match ":id/story/" => "real#story"
   match ":id/contact/" => "real#contact"
   match ":id/search/" => "real#search"
   match ":name/home/" => "real#home"
   match ":name/admin/" => "real#admin"
    match ":name/adminhome/" => "real#adminhome"
  #match ":name/home/" => "real#home"
 match "/:id/" => "real#basic_view"
  match "/:id/basic_view" => "real#basic_view"
  match "real/usersignup" => "real#usersignup",:via => :post
   match "real/property_add" => "real#property_add",:via => :post
  match "real/contact" => "real#contact", :as => :delete
  match "real/homesearch" => "real#homesearch",:via => :post
  match "real/contact" => "real#contact",:via => :post
  match "real/search" => "real#search",:via => :post
   #match "real/home" => "real#home",:via => :post
    match "real/property_delete" => "real#property_delete",:via => :post
	 match "real/property_edit" => "real#property_edit",:via => :post
    match "real/admin_property_view" => "real#admin_property_view",:via => :post
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  match ':controller(/:action(/:id))(.:format)'
 

end
