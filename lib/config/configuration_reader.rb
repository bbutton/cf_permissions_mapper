require 'json'
require 'io/console'
require_relative '../config/configuration'

class ConfigurationReader
  def initialize file_name
    @file_name = file_name
  end

  def parse
    puts Dir.getwd
    file_contents = IO.read @file_name
    contents = JSON.parse file_contents
    Configuration.new contents['uaa_endpoint'], contents['client_user_name'], contents['client_secret'], contents['use_ssl']
  end
end