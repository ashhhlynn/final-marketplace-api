# exit on error
set -o errexit

bundle install
# bundle exec rails assets:clean
bundle exec rails db:migrate
bundle exec rails db:seed


#if you have seeds to run add:
# bundle exec rails db:seed