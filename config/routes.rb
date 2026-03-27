Rails.application.routes.draw do
  devise_for :users

  get "up" => "rails/health#show", as: :rails_health_check

  get "calendar" => "pages#calendar", as: :calendar
  get "tracking" => "pages#tracking", as: :new_tracking
  get "insights" => "pages#insights", as: :insights
  get "profile" => "pages#profile", as: :profile

  root "pages#home"
end
