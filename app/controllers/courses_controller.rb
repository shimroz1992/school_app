class CoursesController < ApplicationController
  before_action :set_course, only: %i[show edit update destroy add_request]

  # GET /Courses or /Courses.json
  def index
    @courses = Course.all
  end

  # GET /Courses/1 or /Courses/1.json
  def show
  end

  # GET /Courses/new
  def new
    @course = Course.new
  end

  # GET /Courses/1/edit
  def edit
  end

  # POST /Courses or /Courses.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /Courses/1 or /Courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /Courses/1 or /Courses/1.json
  def destroy
    @course.destroy

    respond_to do |format|
      format.html { redirect_to dashboards_path, notice: 'Course was successfully destroyed.' }
      format.json { success 'destroyed' }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def course_params
    params.require(:course).permit(:name, :sub_name, :start_at, :end_at, :fees, :tutor_name, :course_duration,
                                   :description, :batch_id)
  end
end
