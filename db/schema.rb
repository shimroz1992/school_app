# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_302_100_232) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'batches', force: :cascade do |t|
    t.integer 'max_count'
    t.string 'name'
    t.bigint 'school_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['school_id'], name: 'index_batches_on_school_id'
  end

  create_table 'connections', force: :cascade do |t|
    t.bigint 'student_id'
    t.bigint 'course_id'
    t.bigint 'batch_id'
    t.bigint 'school_id'
    t.boolean 'status', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['batch_id'], name: 'index_connections_on_batch_id'
    t.index ['course_id'], name: 'index_connections_on_course_id'
    t.index ['school_id'], name: 'index_connections_on_school_id'
    t.index ['student_id'], name: 'index_connections_on_student_id'
  end

  create_table 'courses', force: :cascade do |t|
    t.string 'name'
    t.string 'sub_name'
    t.time 'start_at'
    t.time 'end_at'
    t.string 'fees'
    t.string 'tutor_name'
    t.string 'course_duration'
    t.string 'description'
    t.bigint 'batch_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['batch_id'], name: 'index_courses_on_batch_id'
  end

  create_table 'schools', force: :cascade do |t|
    t.string 'name'
    t.string 'address'
    t.bigint 'owner_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['owner_id'], name: 'index_schools_on_owner_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.integer 'role', default: 0, null: false
    t.string 'first_name'
    t.string 'last_name'
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'connections', 'users', column: 'student_id'
  add_foreign_key 'schools', 'users', column: 'owner_id'
end
