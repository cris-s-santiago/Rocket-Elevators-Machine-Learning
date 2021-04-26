Rails.application.routes.draw do

  get 'watson/update'
  resources :leads
  resources :quotes
  resources :interventions

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'


  authenticate :user, ->(user) { user.admin? || user.employee? } do
    mount Blazer::Engine, at: "blazer"
  end

  devise_for :users

  scope '/admin' do
    resources :users
  end

  root :to => "main#index"

  get "/", to: "main#index"
  get "/index", to: "main#index"
  get "/residential", to: "main#residential"
  get "/commercial", to: "main#commercial"
  get "/new", to: "registrations#new"
  get "/interventions", to: "interventions#index"

  get 'get_buildings/', to: 'interventions#get_buildings'  
  get 'get_batteries/', to: 'interventions#get_batteries'  
  get 'get_columns/', to: 'interventions#get_columns'  
  get 'get_elevators/', to: 'interventions#get_elevators'  


  get '/speaker', to: 'main#speaker'
  get '/speechToText', to: 'main#stt'
  post '/speechToText/speechConverter', to: "main#speechConverter"
  post "/speaker/identifySpeaker", to: "main#identifySpeaker"
  # get "test", to: "test#index"
  # get "test2", to: "test#test2"
  # post "test2", to: "media#getContent"
  # post 'form_path', to: 'media#getContent'

  get '/react/weather', to: 'elevator_media#react'
  get '/getWeatherReact', to: 'elevator_media#getWeatherReact'

  get '/elevator_media', to: 'elevator_media#index'
  post '/elevator_media', to: 'elevator_media#getWeather'
  get '/getWeather', to: 'elevator_media#getWeather'
  get '/getJoke', to: 'elevator_media#getJoke'
  get '/getGif', to: 'elevator_media#getGif'
  get '/getAdvice', to: 'elevator_media#getAdvice'
  get '/getProgJoke', to: 'elevator_media#getProgJoke'
  get '/getDarkJoke', to: 'elevator_media#getDarkJoke'

end
