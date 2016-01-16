# Peek::AltRoutes

Easily toggle alternate controllers and routes.

![screen shot 2016-01-15 at 11 33 56 pm](https://cloud.githubusercontent.com/assets/283496/12372401/67358846-bc23-11e5-83eb-20778411ff0d.png)


Things this peek view provides:

- A ready to go Rails route constraint for switching controllers and routes
- A toggle button to quickly enable and disable the alternate routes

## Installation

Add this line to your application's Gemfile:

    gem 'peek-alt-routes

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install peek-alt-routes

## Usage

Add the following to your `config/initializers/peek.rb`:

```ruby
Peek.into Peek::Views::AltRoutes
```

You may provide a `name` option to the Peek view to set the button display text.

```ruby
Peek.into Peek::Views::AltRoutes, name: 'Staff Redesign'
```

Add the following to your `app/assets/javascripts/application.js`:

```javascript
//= require peek/views/alt_routes
```

Add the following to your `app/assets/javascripts/application.css`:

```css
/*
 *= require peek/views/alt_routes
 */
```

Use the `peek_alt_routes?` route constraint as you see fit. In `config/routes.rb`:

```ruby
  # Remember that Rails matches the first route it finds (top to bottom) so
  # be sure to put any constrained routes before the open routes.

  constraints peek_alt_routes?: true do
    get '/about', to: 'next_site#about'
    get '/contact', to: 'next_site#contact'
  end
  get '/about', to: 'site#about'
  get '/contact', to: 'site#contact'

  # single case
  get 'new-site-only' to: 'new_site#only', constraints: { peek_alt_routes?: true }

  # DRY routes using routing concerns ( >= Rails 4.0 )
  concern :static_pages do
    get '/about, action: 'about'
    get '/contact, action: 'contact'
  end
  scope controller: 'next_site', constraints: { peek_alt_routes?: true } do
    concerns :static_pages
    get '/help', action: 'help'
  end
  scope controller: 'site' do
    concerns :static_pages
  end

```

## Notes

 * Be sure to render the Peek bar in your alternate views so it may be disabled.
 * Be sure to implement user security into your alternate controllers. Peek-alt-routes
 simply sets and checks a cookie for determining which routes to use.
 * The `peek_alt_routes?` method is available in controllers as well should you need it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
