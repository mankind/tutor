class TutorshipsController < ApplicationController
  before_action :set_tutorship, only: [:show, :edit, :update, :destroy]

  # GET /tutorships
  # GET /tutorships.json
  def index
    @tutorships = Tutorship.all
  end

  # GET /tutorships/1
  # GET /tutorships/1.json
  def show
  end

  # GET /tutorships/new
  def new
    @tutorship = Tutorship.new
  end

  # GET /tutorships/1/edit
  def edit
  end

  # POST /tutorships
  # POST /tutorships.json
  def create
    @tutorship = Tutorship.new(tutorship_params)
    respond_to do |format|
      if @tutorship.save

        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully created.' }
        format.json { render :show, status: :created, location: @tutorship }
      else
        format.html { render :new }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutorships/1
  # PATCH/PUT /tutorships/1.json
  def update
    respond_to do |format|
      if @tutorship.update(tutorship_params)
        format.html { redirect_to @tutorship, notice: 'Tutorship was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutorship }
      else
        format.html { render :edit }
        format.json { render json: @tutorship.errors, status: :unprocessable_entity }
      end
    end
  end

  def invite_to_tutorship
    @tutor = User.find(params[:tutor_id] )
    @student = current_user
    @enquiry = current_user.enquiries.last
    @tutor.pending_invites_to_be_a_tutor.create(subject: @enquiry.subject, message: @enquiry.note,  student_id: current_user.id, status: :invited)
   
    redirect_to :tutor_profiles
  end

  def accept_tutorship
    @tutorship = Tutorship.find(params[:tutorship])
    accepted_tutorship = @tutorship.update(status: :accepted)
    @tutor = User.find(@tutorship.tutor_id)
    @tutor.tutorships_as_tutor << @tutorship
    redirect_to :tutor_profiles
  end

  def tutorpage
    @invitation_to_tutorship = current_user.pending_invites_to_be_a_tutor
    @accepted_invites = current_user.tutorships_as_tutor
  end

  def studentpage
    @accepted_tutorship_request_for_student = Tutorship.where(student_id: current_user.id).where(status: Tutorship.statuses[:accepted]).to_a

   @a = current_user.tutorships_as_student.where(status: Tutorship.statuses[:accepted])

  end

  # DELETE /tutorships/1
  # DELETE /tutorships/1.json
  def destroy
    @tutorship.destroy
    respond_to do |format|
      format.html { redirect_to tutorships_url, notice: 'Tutorship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutorship
      @tutorship = Tutorship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutorship_params
      params.require(:tutorship).permit(:tutor_id, :student_id, :status, :message, :subject)
    end
end
