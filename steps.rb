# to generate category: bin/rails g scaffold admin::category name:string description:text
# to generate product: bin/rails g scaffold admin::product name:string description:text price:integer category:references active:boolean
# rails g scaffold admin::stock product:references amount:integer size:string
# bin/rails g scaffold admin::order customer_email:string status:integer total:integer address:string
# 
# rails generate config:install
# bin/importmap pin chart.js
# bin/rails g stimulus dashboard
# if facing error with charts.js:
# 1. run bundle install  ./bin/rails assets:precompile   ./bin/rails assets:clean
# 2. run bin/importmap pin chart.js and fix imports
