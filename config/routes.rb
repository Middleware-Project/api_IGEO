Rails.application.routes.draw do
  namespace :api do
    namespace :v2 do
      resources :nodes, :sensors, :measures
    end
  end
end
