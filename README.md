# Welcome to My Company @ Work -- a simple internal status update tool for workgroups

This is a twitter-like clone for use with small work teams. Each user has the option to change their status or add an accomplishment. The main window pane contains a recent list of statuses and accomplishments. And the sidebar contains the most recent changes for each user.

![Screenshot of At Work](screenshot.png?raw=true)

# System Requirements

* Ruby v1.8.7
* Ruby on Rails v3.2.13
* MySQL or SQLite

# Setting Things Up

My Company @ Work supports MySQL and SQLite databases.

Edit config/database.yml and specify database names and authentication
details.

   $ bundle install

   $ bundle exec rake db:create

   $ bundle exec rake at_work:setup

# Running The App

Now you should be able to launch the Rails server and point your web browser
to http://localhost:3000

   $ bundle exec rails s

# License

Copyright (c) 2010-2014 by Michael Gorski, released under the MIT license.

This program is free software: you can redistribute it and/or modify it
under the terms of the MIT license.

This program is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
FOR A PARTICULAR PURPOSE.

See LICENSE file for more details.