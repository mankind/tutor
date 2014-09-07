class TutorProfilesController < ApplicationController
  before_action :set_tutor_profile, only: [:show, :edit, :update, :destroy]

  # GET /tutor_profiles
  # GET /tutor_profiles.json
  def index
    @tutor_profiles = TutorProfile.all
  end

  # GET /tutor_profiles/1
  # GET /tutor_profiles/1.json
  def show
  end

  # GET /tutor_profiles/new
  def new
    @tutor_profile = TutorProfile.new
  end

  # GET /tutor_profiles/1/edit
  def edit
  end

  # POST /tutor_profiles
  # POST /tutor_profiles.json
  def create
    @tutor_profile = TutorProfile.new(tutor_profile_params)

    respond_to do |format|
      if @tutor_profile.save
        format.html { redirect_to @tutor_profile, notice: 'Tutor profile was successfully created.' }
        format.json { render :show, status: :created, location: @tutor_profile }
      else
        format.html { render :new }
        format.json { render json: @tutor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tutor_profiles/1
  # PATCH/PUT /tutor_profiles/1.json
  def update
    respond_to do |format|
      if @tutor_profile.update(tutor_profile_params)
        format.html { redirect_to @tutor_profile, notice: 'Tutor profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @tutor_profile }
      else
        format.html { render :edit }
        format.json { render json: @tutor_profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutor_profiles/1
  # DELETE /tutor_profiles/1.json
  def destroy
    @tutor_profile.destroy
    respond_to do |format|
      format.html { redirect_to tutor_profiles_url, notice: 'Tutor profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tutor_profile
      @tutor_profile = TutorProfile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tutor_profile_params
      params.require(:tutor_profile).permit(:user_id, :university, :degree_subject, :teaching_subject, :location, :about_myself, :tutoring_approach, :teaching_experience, :extracurricular_interests)
    end
end
