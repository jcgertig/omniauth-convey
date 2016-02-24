# OmniAuth::Convey

A OmniAuth strategy for Twitch

## Installation

Add this line to your application's Gemfile:

    gem 'omniauth-convey'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-convey

## Usage

Here's an example for adding the middleware to a Rails app in `config/initializers/omniauth.rb`:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :convey, ENV["TWITCH_CLIENT_ID"], ENV["TWITCH_CLIENT_SECRET"]
end
```

## Auth Hash

Here's an example *Auth Hash* available in `request.env['omniauth.auth']`:

```ruby
{
  provider: 'convey',
  uid: 12345678,
  info: {
    email: 'johndoe@gmail.com',
  },
  credentials: {
    token: 'asdfghjklasdfghjklasdfghjkl', # OAuth 2.0 access_token, which you may wish to store
    expires: false # this will always be false
  },
  extra: {
    raw_info: {
      _id: 12345678,
      email:'johdoe@gmail.com',
    }
  }
}
```
