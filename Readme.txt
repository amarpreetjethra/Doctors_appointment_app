# Steps to run project locally
cd to project path
bundle install
rake db:migrate
rails s 
visit localhost:3000 on browser

#Database dependency Mysql
#ruby 2.4.1
#rails 5

# You can use credentials for doctor login:

email: doctor1@gmail.com password:111333

email: doctor2@gmail.com password:111333


# You can use credentials for patient login:

email: patient1@gmail.com password:111333

email: patient2@gmail.com password:111333


#For testing mail functionality, place proper values of username and password need in both of the below files:
lib/tasks/cron.rake
config/environments/development.rb


# I have used whenever gem for mail functionality, if you face any problem you can add direct command in crontab file:
gedit crontab -e

* * * * * /bin/bash -l -c 'cd /path_to_rails_app && RAILS_ENV=development bundle exec rake cron:deliver_emails --silent'



