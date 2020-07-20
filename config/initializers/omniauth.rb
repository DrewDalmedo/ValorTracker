Rails.application.config.middleware.use OmniAuth::Builder do
    # development test authentication
    provider :developer unless Rails.env.production?

    # add auth types below
    provider :google_oauth2,  ENV['GOOGLE_CLIENT_ID'],  ENV['GOOGLE_CLIENT_SECRET']

end