Rails.application.config.middleware.use OmniAuth::Builder do
    # developer authentication
    provider :developer unless Rails.env.production?

    # add auth types below
    '''
    planned auth strategies:
        - google
        - discord
        - twitch
    '''
    # provider :google,  ENV['GOOGLE_KEY'],  ENV['GOOGLE_SECRET']
    # provider :discord, ENV['DISCORD_KEY'], ENV['DISCORD_SECRET']
    # provider :twitch,  ENV['TWITCH_KEY'],  ENV['TWITCH_SECRET']

end