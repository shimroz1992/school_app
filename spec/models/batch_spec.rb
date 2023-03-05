require 'rails_helper'

RSpec.describe Batch, type: :model do
  let(:user) { create(:user) }
  let(:school) { create(:school, owner_id: user.id) }
  let(:batch) { build(:batch, school_id: school.id) }

  it 'is valid with valid attributes' do
    expect(batch).to be_valid
  end

  it 'is not valid without a name' do
    batch.name = nil
    expect(batch).to_not be_valid
  end

  it 'is not valid without a max_count' do
    batch.max_count = nil
    expect(batch).to_not be_valid
  end

  it 'is not valid without a school_id' do
    batch.school_id = nil
    expect(batch).to_not be_valid
  end

  before(:all) do
    User.destroy_all
    School.destroy_all
  end
end
