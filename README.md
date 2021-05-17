# README

* Ruby version 2.5.3
  
* Rails version 5.2.3

* System dependencies
    * Docker
    * Postgres
    
* Starting app
    *  docker-compose build app
    *  docker-compose start app
    *  docker exec -it app_id bash
       rails stock_market:sync
       It will take 10min to initial start app because of stock value sync
  

* Database creation & initialization
    * rails db:seed
    * rails db:migrate
  
* Rubocop
    * rubocop
    