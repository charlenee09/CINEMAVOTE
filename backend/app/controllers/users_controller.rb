# app/controllers/users_controller.rb
class UsersController < ApplicationController
  # Mengizinkan kiriman data dari Next.js tanpa token CSRF karena berbasis API
  skip_before_action :verify_authenticity_token, raise: false

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { message: "Akun berhasil disimpan di database Rails!", user: { id: @user.id, username: @user.username, email: @user.email } }, status: :created
    else
      render json: { message: @user.errors.full_messages.join(", ") }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :tgl_lahir)
  end
end