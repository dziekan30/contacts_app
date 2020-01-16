Rails.application.routes.draw do
  namespace :api do
    get '/first_contacts_url' => 'contacts#contact_all'
    get '/all_contacts_url' => 'contacts#all_contacts'
  end
end
