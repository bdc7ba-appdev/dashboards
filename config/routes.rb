Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get("/", {:controller => "currencies", :action => "home"})

  get("/forex", {:controller => "currencies", :action => "first"})

  get("/forex/:first_currency", {:controller => "currencies", :action => "second"})
  get("/forex/:first_currency/:second_currency", {:controller => "currencies", :action => "convert"})

end
