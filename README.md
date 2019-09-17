BenHughes.name
=============

A simple personal website for Ben Hughes. Uses middleman:

  $ bundle exec middleman
  $ open http://localhosts:4567/

## Deploying

Hosting is handled by dokku as a static site with the [buildpack-nginx](https://github.com/dokku/buildpack-nginx) buildpack (specified in `.env`).

Configuration:

    NGINX_ROOT=build

