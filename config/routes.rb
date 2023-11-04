Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/users", { :controller => "misc", :action => "homepage" })
  get("/users/:path_id", { :controller => "users", :action => "details" })
  post("/update_user/:path_id", { :controller => "users", :action => "update" })

  get("/photos/:path_id", { :controller => "photos", :action => "details" })
end
