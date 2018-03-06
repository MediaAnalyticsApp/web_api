<<<<<<< HEAD
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version  
  2.3.1

* Rails version 
  5.1.4

* System dependencies

* Configuration

* Model generate
rails g model person name:string  --no-timestamps
rails g model site name:string  --no-timestamps
rails g model keyword name:string person:references  --no-timestamps
rails g model page url:string site:references found_date_time:timestamps last_scan_date:timestamps --no-timestamps
rails g model person_page_rank person:references page:references rank:string  --no-timestamps

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
# web_api
Rest API for mobile and desktop apps
>>>>>>> 85b34b33e430d9f1dc5fb8e1646f0dbf
