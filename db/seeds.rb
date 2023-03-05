# Creating Admin user
admin_user = User.new
admin_user.email = 'admin@gmail.com'
admin_user.password = '12345678'
admin_user.first_name = 'test'
admin_user.last_name = 'Admin'
admin_user.role = 2
admin_user.save

# Creating School Admin user
school_admin = User.new
school_admin.email = 'schooladmin@gmail.com'
school_admin.password = '12345678'
school_admin.first_name = 'test'
school_admin.last_name = 'school Admin'
school_admin.role = 1
school_admin.save

# creating school for the same school admin user
school_admin.create_own_school(name: 'test school', address: 'test address')

# creating batch for the same school
batch = school_admin.own_school.batches.new
batch.max_count = 10
batch.name = 'test batch 1'
batch.save

# creating course for the same
course = batch.courses.new
course.name = 'test course'
course.description = 'test description of courses'
course.sub_name = 'test subject'
course.start_at = Time.current
course.end_at = Time.current + 1.hours
course.fees = '10,000'
course.tutor_name = 'Test name'
course.course_duration = '5 months'
course.save

# creating connection between the students and course
