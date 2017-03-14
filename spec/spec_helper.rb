require File.expand_path("../../config/environment", __FILE__)

require "webmock/rspec"

Dir[APP_ROOT.join("spec/support/**/*.rb")].each { |f| require f }

RSpec.configure do |config|
  config.include GithubAPIRequestStubMacros
end
