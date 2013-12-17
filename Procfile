web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb
redis: redis-server config/redis.conf --port $PORT
sidekiq: bundle exec sidekiq
