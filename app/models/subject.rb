class Subject < ApplicationRecord
  has_many :test_results, dependent: :restrict_with_exception
end
