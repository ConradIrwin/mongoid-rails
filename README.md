mongoid-rails is the safest way to use Mongoid with Rails.


Installation
------------

Add mongoid-rails to your Gemfile.

```ruby
gem 'mongoid-rails
```

Then run `bundle install`.


Usage
-----

You don't need to use `mongoid-rails` explicitly, instead it adds protection against a few known hash injection attacks automatically.

### Forbidden attributes protection

This causes things like `User.create(params[:user])` to raise an exception. If
you want to create a user from parameters, you need to explicitly permit the
fields that you want to allow.

```ruby
User.create(params[:user].permit(:name, :email))
```

This prevents an attacker from sneakily setting `params[:user][:admin] = true` or similar.

### Forbidden query protection

This protects you against query injection attacks. It makes the following code safe:

```ruby
User.where(api_token: params[:api_token])
```

Without `mongoid-rails` an attacker can send `?api_token[$regex]=.*` to guess
api tokens from your app. With `mongoid-rails` that will cause an exception to
be raised.

Meta
----

`mongoid-rails` is released under the MIT license. See `LICENCE.MIT` for details.

It currently only supports rails3 with the strong parameters gem installed. I'd
love a patch to make it work with the mongoid4 beta releases.
