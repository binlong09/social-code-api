# README

## How to start the server locally
1. Install Postgresql with `brew install psql` (look up how to install brew if you don't have Homebrew)
2. Clone the project
3. Change directory, then run `bundle install`
4. Then run `rails db:create && rails db:migrate` to set up the database
5. Finally, run `rail server` to start server at default port 3000. For custom port such as 5000, use `rails server -p 5000`

After doing these for the first time, all you need to do is cd into the directory and run `rails server`
