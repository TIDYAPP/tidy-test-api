Rails.application.routes.draw do

  root to: "home#index"

  mount API => '/'

  mount GrapeSwaggerRails::Engine, at: "/apidocs"
  
end
