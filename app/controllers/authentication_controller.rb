# frozen_string_literal: true

class AuthenticationController < ApplicationController
  def login
    @user = User.find_by_email(params[:email])
    if @user&.authenticate(params[:password])
      send_token
    else
      render json: { error: 'Wrong email or password. Try again!' }, status: :unauthorized
    end
  end

  private

  def login_params
    params.permit(:email, :password)
  end

  def send_token
    token = JsonWebToken.encode(user_id: @user.id)
    time = Time.now + 6.months.to_i
    render json: { token: token, exp: time.strftime('%m-%d-%Y %H:%M') },
           status: :ok
  end
end
