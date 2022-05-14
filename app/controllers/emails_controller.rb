class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]
  before_action :set_student

  # GET /emails or /emails.json
  def index
    @emails = Email.all
  end
  def viewSentEmails
    @emails = Email.where(:sender => @student.name)
  end
  def viewInbox
    @emails = @student.emails
  end

  # GET /emails/1 or /emails/1.json
  def show
  end

  # GET /emails/new
  def new
    @email = Email.new
  end

  # GET /emails/1/edit
  def edit
  end

  # POST /emails or /emails.json
  def create
    @email = Email.new(email_params)
    # translate the receiver to the id of the student getting the email
    @recipient_name = @email.reciever
    @recipient_student = Student.find_by(:name => @recipient_name)
    @email.Student_id = @recipient_student.id

    respond_to do |format|
      if @email.save
        format.html { redirect_to email_url(@student, @email), notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emails/1 or /emails/1.json
  def update
    respond_to do |format|
      if @email.update(email_params)
        format.html { redirect_to email_url(@email), notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emails/1 or /emails/1.json
  def destroy
    @email.destroy

    respond_to do |format|
      format.html { redirect_to emails_url, notice: "Email was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_email
      if params[:email_id]
        @email = Email.find(params[:email_id])
      end
    end
    def set_student
      @student = Student.find_by_id(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def email_params
      params.require(:email).permit(:sender, :reciever, :content, :Student_id)
    end
end