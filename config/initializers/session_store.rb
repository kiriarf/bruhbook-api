if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_bruhbook-api", domain: "bruhbook-api.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_bruhbook-api"
end