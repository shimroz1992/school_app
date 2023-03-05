require 'rails_helper'

RSpec.describe Course, type: :model do
  let(:user) { create(:user) }
  let(:school) { create(:school, owner_id: user.id) }
  let(:batch) { create(:batch, school_id: school.id) }
  let(:course) { build(:course, batch_id: batch.id) }

  it 'is valid with valid attributes' do
    expect(course).to be_valid
  end

  it 'is not valid without a name' do
    course.name = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a sub_name' do
    course.sub_name = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a start_at' do
    course.start_at = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a end_at' do
    course.end_at = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a fees' do
    course.fees = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a tutor_name' do
    course.tutor_name = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a course_duration' do
    course.course_duration = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a description' do
    course.description = nil
    expect(course).to_not be_valid
  end

  it 'is not valid without a batch_id' do
    course.batch_id = nil
    expect(course).to_not be_valid
  end

  before(:all) do
    User.destroy_all
    School.destroy_all
    Batch.destroy_all
  end
end
