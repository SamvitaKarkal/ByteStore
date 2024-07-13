# to generate category: bin/rails g scaffold admin::category name:string description:text
# to generate product: bin/rails g scaffold admin::product name:string description:text price:integer category:references active:boolean
# rails g scaffold admin::stock product:references amount:integer size:string
# bin/rails g scaffold admin::order customer_email:string status:integer total:integer address:string