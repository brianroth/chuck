# Rails API JWT Authentication sample

Rails implementation of the [NodeJS JWT Authentication sample](https://github.com/auth0-blog/nodejs-jwt-authentication-sample) for use with the example client described at [Adding authentication to your React Flux app](https://auth0.com/blog/2015/04/09/adding-authentication-to-your-react-flux-app/).

This is a Rails API that supports username and password authentication with JWTs and has APIs that return Chuck Norris phrases. How awesome is that?

## Available APIs

### User APIs

#### POST `/users`

You can do a POST to `/users` to create a new user.

The body must have:

* `username`: The username
* `password`: The password
* `extra`: Some extra information you want to save from the user (It's a string). This could be a color or anything at all.

It returns the following:

```json
{
  "id_token": {jwt}
}
```

The JWT is signed with the secret located at the `config.json` file. That JWT will contain the `username` and the `extra` information sent.

#### POST `/sessions/create`

You can do a POST to `/sessions/create` to log a user in.

The body must have:

* `username`: The username
* `password`: The password

It returns the following:

```json
{
  "id_token": {jwt}
}
```

The JWT is signed with the secret located at the `config.json` file. That JWT will contain the `username` and the `extra` information that you sent at signup time.

### Quotes API

#### GET `/api/random-quote`

It returns a String with a Random quote from Chuck Norris. It doesn't require authentication.

#### GET `/api/protected/random-quote`

It returns a String with a Random quote from Chuck Norris. It requires authentication. 

The JWT must be sent on the `Authorization` header as follows: `Authorization: Bearer {jwt}`

## Running it

Just clone the repository, run `bundle install` and then `rails s -p3001`. That's it :).