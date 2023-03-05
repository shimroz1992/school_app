require 'rails_helper'

RSpec.describe School, type: :model do
  let(:user) { create(:user) }
  let(:school) { build(:school, owner_id: user.id) }

  it 'is valid with valid attributes' do
    expect(school).to be_valid
  end

  it 'is not valid without a name' do
    school.name = nil
    expect(school).to_not be_valid
  end

  it 'is not valid without a max_count' do
    school.address = nil
    expect(school).to_not be_valid
  end

  it 'is not valid without a owner_id' do
    school.owner_id = nil
    expect(school).to_not be_valid
  end

  before(:all) do
    User.destroy_all
  end
end
