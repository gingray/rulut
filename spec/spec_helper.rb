require "bundler/setup"
require 'pry'
require "rulut"

FIXTURE_PATH = File.expand_path('../fixtures', __FILE__)

module Helper
  def file_fixture(path)
    File.open(File.join(FIXTURE_PATH, path))
  end
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"
  config.include Helper

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
