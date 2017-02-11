# SHORTEN ME
Deployed app: [here](https://blooming-reef-94267.herokuapp.com)!

# RUBY VERSION:
Rails 5.0.1
Ruby 2.4.0

# FEATURES:
- Generate shorten link and QR code from user's URL
- Redirect to original link when user input the shorten link
- Provide simple analytics data with total hits, visualize using line chart
# INSTALLATION GUIDE
Run the following command:

```Shell
git clone https://github.com/someone1xx6/shortenme.git

cd shortenme/

bundle install

bundle exec figaro install

rails generate ahoy:stores:active_record

rails db:migrate

rails s

```







