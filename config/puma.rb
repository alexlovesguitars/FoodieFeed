# Puma configuration file

# Thread settings: min and max threads per worker
max_threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }
min_threads_count = ENV.fetch("RAILS_MIN_THREADS") { max_threads_count }
threads min_threads_count, max_threads_count

# Set environment
rails_env = ENV.fetch("RAILS_ENV") { "development" }
environment rails_env

# Set the port for Render (Render automatically provides $PORT)
port ENV.fetch("PORT") { 3000 }

# PID file location
pidfile ENV.fetch("PIDFILE") { "tmp/pids/server.pid" }

# Workers (forked processes) for production
if rails_env == "production"
  workers Integer(ENV.fetch("WEB_CONCURRENCY") { 2 }) # typical default
  preload_app!  # preload app before forking workers
end

# Optional: longer worker timeout in development
worker_timeout 3600 if rails_env == "development"

# Allow Puma to be restarted by `bin/rails restart`
plugin :tmp_restart
