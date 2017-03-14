require "pathname"
require "dotenv"
require "httparty"
require "active_support/core_ext/date/calculations"

APP_ROOT = Pathname.new(File.expand_path("../../", __FILE__))
APP_NAME = APP_ROOT.basename.to_s

Dotenv.load("#{APP_ROOT}/.env")

Dir[APP_ROOT.join("app/models/**/*.rb")].each { |file| require file }
