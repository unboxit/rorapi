require 'rails_helper'

RSpec.describe Brand, type: :model do
  # Association test
  # ensure a brand record has categories
  it { should belong_to(:category) }

  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:name) }
end
