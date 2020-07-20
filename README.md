# ValorTracker
An MVC web app for Riot's Valorant.

## About
ValorTracker is a web app designed to allow users to keep track of various Valorant-related things. Right now, the app supports the creation of guides for the different maps currently in the game. All data is persisted to an SQLite database, with plans to move to PostgreSQL later.

This app uses [Rails](https://rubyonrails.org/), a framework for creating web apps.

## Usage
Currently, you must run a local development server to use the app.

First, open a terminal and clone the repository:
```
$ git clone https://github.com/DrewDalmedo/ValorTracker
```

Next, `cd` into the ValorTracker directory and run `bundle install` to install the app's dependencies:
```
cd ValorTracker && bundle install
```

After installing the app's dependencies, you need to run a database migration:
```
$ rails db:migrate
```

If you want the database to be populated, you must also seed the database:
```
$ rails db:seed
```

Finally, run `rails s` to get the server running and go to `localhost:3000` in your browser:
```
$ rails s
```