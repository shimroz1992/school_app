class DashboardsController < ApplicationController
  before_action :set_course, only: %i[add_request]
  before_action :set_connection, only: %i[approve_request]
  before_action :set_user, only: %i[edit update destroy]

  # GET /dashboards or /dashboards.json
  def index
    @courses = Course.all
  end

  def new
    @school_admin = User.new
  end

  def create
    @school_admin = User.find_or_create_by(user_params)
    respond_to do |format|
      if @school_admin.save
        format.html { redirect_to dashboards_path, notice: 'School Admin was successfully created.' }
        format.json { render :show, status: :created, location: @school_admin }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @school_admin.update(user_params)
        format.html { redirect_to dashboards_path, notice: 'School Admin was successfully updated.' }
        format.json { render :show, status: :ok, location: @school_admin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @school_admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @school_admin.destroy

    respond_to do |format|
      format.html { redirect_to dashboards_path, notice: 'School admin was successfully destroyed.' }
      format.json { success 'destroyed' }
    end
  end

  def add_request
    respond_to do |format|
      if @course.connections.find_or_create_by!(student_id: current_user&.id, school_id: @course&.batch&.school&.id,
                                                batch_id: @course&.batch&.id)
        format.html { redirect_to root_path, notice: 'course requeste was created successfully.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  def request_review
    @request_review = if current_user.student?
                        current_user.connections.student_connection(current_user&.id)
                      elsif current_user.school_admin?
                        Connection.school_admin_connection(current_user.own_school&.id)
                      else
                        Connection.all.includes(%i[course batch student school])
                      end
  end

  def list_batch
    @list_batch = if current_user.student?
                    current_user.batches.student_batch
                  elsif current_user.school_admin?
                    Batch.school_admin_batch(current_user.own_school&.id)
                  else
                    Batch.all.includes(:school)
                  end
  end

  def list_school
    if current_user.student?
      @list_schools = current_user.schools.student_school
    elsif current_user.school_admin?
      @school = current_user.own_school
    else
      @list_schools = School.all.includes(:owner)
    end
  end

  def list_school_admin
    @list_school_admins = User.where(role: 1)
  end

  def approve_request
    respond_to do |format|
      if @connection.update(status: true)
        format.html { redirect_to root_path, notice: 'course requeste was aprrove successfully.' }
        format.json { render :show, status: :created, location: @connection }
      else
        format.html { render :index, status: :unprocessable_entity }
        format.json { render json: @connection.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def set_connection
    @connection = Connection.find(params[:id])
  end

  def set_user
    @school_admin = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :role)
  end
end
