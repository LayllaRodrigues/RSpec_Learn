require "rspec/collection_matchers"
require_relative "../lib/user"
require_relative "../lib/cart_of_products"
require_relative "../lib/subcategory"
require_relative "../lib/category"
require_relative "../lib/client"
require_relative "../lib/loan_checker"

require "pry"

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
