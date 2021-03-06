OnlineApplication::Application.routes.draw do
  resources :computed_gpas


  resources :termunits


  resources :subject_summaries


  resources :subjects


  resources :grades


  resources :students


  resources :requirements


  resources :requirement_types


  resources :supplemental_details


  resources :education_details

  resources :employment_details

  resources :dashboard

  resources :personal_details

  resources :online_application_forms

  devise_for :users

  get 'updates/grade/(:id)' => 'updates#update_grade'
  get 'updates/gpa/(:id)' => 'updates#update_gpa'
  get 'updates/fail/(:id)' => 'updates#update_fail'
  get 'api/gpa/(:id)' => 'updates#get_gpa'
  get '/updates/gpa_new/(:id)' => 'updates#save_whatif'
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
  # match ':controller(/:action(/:id))(.:format)'

  resources :admissions

  resources :online_inquiries
  post '/admissions/submit/(:id)' => 'admissions#update'
  post '/realtime/(:id)' => 'realtime#realtime_submit'
  get '/online_application_status/update_status/(:id)' => 'online_application_forms#update_status'
  get '/excel/export' => 'dashboard#excel'
  get 'submit_requirement' => 'requirements#submit_requirement'
  post 'supplement/(:id)' => 'supplemental_details#update'
  root :to => 'dashboard#index'
end
