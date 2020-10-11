class DoctorsController < ApplicationController
  before_action :set_doctor, only: [:show, :destroy]
  def index
    if current_user.role == 'doctor'
    @doc_info = Doctor.joins(:user).where("doctors.users_id = ?", current_user)
    else
    @doc_info = Doctor.joins(:user)
    end
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    @doctor = Doctor.new(doctor_params)
    if @doctor.save
      redirect_to doctors_path
    else
      render :new
    end
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end

  private
    def set_doctor
      @doctor = Doctor.find(params[:id])
    end

    def doctor_params
      params.require(:doctor).permit(:name, :specialty, :phone, :password, :password_confirmation)
    end
end
