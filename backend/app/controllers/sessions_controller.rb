# app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, raise: false

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      render json: {
        message: "Login sukses!",
        user: {
          id: @user.id,
          username: @user.username,
          email: @user.email,
          tgl_lahir: @user.tgl_lahir,
          role: @user.role
        }
      }, status: :ok

    else
      render json: {
        message: "Email atau kata sandi salah, silakan cek kembali!"
      }, status: :unauthorized
    end
  end
end