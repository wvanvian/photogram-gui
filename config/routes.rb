Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  get("/users", { :controller => "misc", :action => "homepage" })
  get("/users/:path_id", { :controller => "users", :action => "details" })
  post("/add_user/", { :controller => "users", :action => "create" })
  post("/update_user/:path_id", { :controller => "users", :action => "update" })

  get("/photos", { :controller => "photos", :action => "homepage" })
  get("/photos/:path_id", { :controller => "photos", :action => "details" })
  post("/add_comment", { :controller => "photos", :action => "create" })
  post("/update_photo/:path_id", { :controller => "photos", :action => "update" })
  get("/delete_photo/:path_id", { :controller => "photos", :action => "delete" })
  post("/insert_photo_record", { :controller => "photos", :action => "add_photo" })
end
