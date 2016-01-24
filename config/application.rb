require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TidyApiTest
  class Application < Rails::Application
    ## Newly Added code to set up the api code
    config.paths.add File.join('app', 'api'), glob: File.join('**', '*.rb')
    config.autoload_paths += Dir[Rails.root.join('app', 'api', '*')]

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true

    config.middleware.insert_before 0, "Rack::Cors", :debug => true, :logger => (-> { Rails.logger }) do
      allow do
        origins '*'
        resource '*',
            :headers => :any,
            :methods => [:get, :post, :delete, :put, :options, :head],
            :expose  => ['X-Per-Page','X-Total','X-Total-Pages', 'X-Offset', 'X-Next-Page','X-Page','X-Prev-Page'],
            :max_age => 0
      end
    end
  end
end
