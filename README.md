mongoid-rails is the safest way to use MongoDB with Rails 3 or 4.

Installation
------------

Add mongoid-rails to your Gemfile.

```ruby
gem 'mongoid-rails'
```

Then run `bundle install`.

What does it do?
----------------

Mongoid rails provides protection against [hash-injection
attacks](http://cirw.in/blog/hash-injection) in mongoid.

### Forbidden attributes protection

This causes things like `User.create(setings: params[:settings])` to raise an exception. If
you want to create a user from parameters, you need to explicitly permit the
fields that you want to allow.

```ruby
User.create(settings: params[:settings].permit(:favorite_color))
```

This prevents an attacker from sneakily setting `params[:settings][:admin] = true` or similar.

### Forbidden query protection

This protects you against query injection attacks. It makes the following code safe:

```ruby
User.where(api_token: params[:api_token])
```

Without `mongoid-rails` an attacker can send `?api_token[$gt]=` to guess api
tokens from your app. With `mongoid-rails` that will cause an exception to be
raised.

Meta
----

`mongoid-rails` is released under the MIT license. See `LICENCE.MIT` for details.
