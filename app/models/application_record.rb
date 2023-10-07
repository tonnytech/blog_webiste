# frozen_string_literal: true

# The ApplicationRecord class is the base class for all models in the application.
# It provides common functionality and configuration for database-backed models.
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end
