Integrity — Continuous Integration server
==========
* * *

This is my fork of the [Integrity CI Server][Integrity], with some extra additions
that I deemed necessary to have in the project.


Features:

*   Artifacts

*   Notifications

*   Threaded building

*   Mysql, postgresql, sqlite support

*   RSS feeds for each project, with limit filters

Setup:

NOTE: It is recommended that you install rvm before doing this.

1. Install ruby 1.8.3 (rvm install 1.8.3-p358)

1. Install dependencies (bundle install)

1. Configure Integrity (nano/vim/vi/ee/?? init.rb) (refer to doc/integrity.txt)

1. Configure your rackup (nano/vim/vi/ee/?? config.ru)

1. (Optional, depends on setup) Setup a thin proxy server (nano/vim/vi/ee/?? doc/thin.yml)

1. (Required if you set up a thin server) Setup your HTTPd to connect to 
   thin as a reverse proxy/CGI data handler (refer, again, to doc/integrity.txt)

1. (If you performed the last two steps) Start thin (bundle exec thin -C doc/thin.yml start)

1. Start your HTTPd (if necessary) and enjoy!


[Integrity]: http://github.com/integrity/integrity