# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

Remove the default webpacker
yarn remove @rails/webpacker

Add the required version of Webpacker and other dependancies
yarn add @rails/webpacker@5.4.0 @fullhuman/postcss-purgecss@^4.0.3 postcss@^8.2.10 postcss-loader@^4.0.3 sass@^1.32.7 autoprefixer@^10.2.6

Your package.json should look something like this.
{
  "name": "tails-on-rails",
  "private": true,
  "dependencies": {
     "@fullhuman/postcss-purgecss": "^4.0.3",
     "@rails/actioncable": "^6.0.0",
     "@rails/activestorage": "^6.0.0",
     "@rails/ujs": "^6.0.0",
     "@rails/webpacker": "5.4.0",
     "postcss": "^8.2.10",
     "postcss-loader": "^4.0.3",
     "sass": "^1.32.7",
     "turbolinks": "^5.2.0",
     "webpack": "^4.46.0",
     "webpack-cli": "^3.3.12"
    },
  "version": "0.1.0",
  "devDependencies": {
    "webpack-dev-server": "^3.11.2"
 }
}

* ...
