class DoctorsController < ApplicationController
  before_action :find_doctor, only: [:show, :edit, :update, :destroy]

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
  end

  def create
    doctor = Doctor.create (doctor_params)
    if doctor.valid?
      redirect_to doctor
    else
      flash[:errors] = doctor.errors.full_messages
      redirect_to new_doctor_path
    end
  end

  def edit
  end

  def update
    @doctor.update(doctor_params)
    redirect_to @doctor
  end


  def destroy
    @doctor.destroy
    redirect_to doctors_path  
  end

  private

  def find_doctor
    @doctor = Doctor.find(params[:id])
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialty)
  end

end
