# exit on error
set -o errexit

bundle install
# bundle exec rails assets:clean
bundle exec rake db:migrate
bundle exec rake db:seed


#if you have seeds to run add:
# bundle exec rails db:seed