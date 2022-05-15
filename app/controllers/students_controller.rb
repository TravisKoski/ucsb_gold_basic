class StudentsController < ApplicationController
  before_action :set_student, only: %i[ show edit enroll update destroy view_courses drop_class ]

  # GET /students or /students.json
  def index
    @students = Student.all
  end

  # GET /students/1 or /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end
  #Views the courses for a particular student
  def view_courses
    @courses = @student.courses
  end

  # GET /students/1/edit
  def edit
  end
  def enroll
    @course = Course.find_by_id(params[:course_id])
    @course.update_full_flag
    if @course.isFull
      #create a waitlist if one doesnt already exist
      if !@course.waitlist
        @course.create_waitlist
      end
      @waitlist = @course.waitlist
      #If the student hasn't already been waitlisted, waitlist them
      if @waitlist
        if !@waitlist.students.include? @student
          @waitlist.students << @student
        else
          flash[:notice] = "You are already on the waitlist"
          redirect_to @student and return
        end
      end
      #save changes back to Database
     @course.save && @student.save
      respond_to do |format|
        format.html { redirect_to student_url(@student), notice: "This course is full, you were added to the waitlist" }
        format.json { render :show, status: :created, location: @student }
      end
    else

      respond_to do |format|
        # add the course to the student's course list
        if @student.update(courses: @student.courses << @course)
          
           #The course also knows that a student enrolled in it, so update the full indicator
          format.html { redirect_to student_url(@student), notice: "Student was successfully enrolled" }
          format.json { render :show, status: :created, location: @student }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @student.errors, status: :unprocessable_entity }
        end
      
      end
    end

    
  end

  #Drops a student from a class and
  def drop_class
    @course = Course.find(params[:course_id])
    respond_to do |format|
      # add the course to the student's course list
      @student.courses.delete(@course)
      if @course.waitlist
         @course.waitlist.students.delete(@student)
      end
      if @student.save && @course.save
        
        @course.update_full_flag #The course also knows that a student enrolled in it, so update the full indicator
        format.html { redirect_to student_url(@student), notice: "Student was succesfully dropped" }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end



  # POST /students or /students.json
  def create
    @student = Student.new(student_params)

    respond_to do |format|
      if @student.save
        format.html { redirect_to student_url(@student), notice: "Student was successfully created." }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1 or /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to student_url(@student), notice: "Student was successfully updated." }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1 or /students/1.json
  def destroy
    @student.destroy

    respond_to do |format|
      format.html { redirect_to students_url, notice: "Student was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      #Line below is for the case when we are enrolling
      if params[:student_id]
        @student = Student.find(params[:student_id])
      else
        @student = Student.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def student_params
      params.require(:student).permit(:name, :search)
    end
end
