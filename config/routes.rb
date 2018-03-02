Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      resources :keywords, :pages, :persons, :person_page_rank, :sites, :users
      resources :pages, param: :found_date_time
      # get '/:found_date_time' to 'pages#show' 
      #, constraints: { format: :json }
      #get :by_range, ->(start_date, end_date) { where(date: start_date..end_date) 
      
      #get :show_in_range, path: '/pages/show_in_range', only: [index]
    
    end
  end
end
