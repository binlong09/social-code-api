# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authorize_request, only: %i[index update destroy show]
  before_action :find_user, except: %i[create index recover_password show]

  def index
    render json: @current_user, status: :ok
  end

  def show
    @user = User.includes(:study_group_memberships, :study_group_bookmarks).find(params[:id])
    render json: @user, status: :ok
  end

  def create
    sleep 1.5
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def update
    render(json: @user) && return if @user.update(user_params)

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  def destroy
    return if @user.destroy

    render json: { errors: @user.errors.full_messages },
           status: :unprocessable_entity
  end

  def recover_password
    @user = User.find_by_email(params[:email].downcase)
    if @user.present?
      @user.send_reset_password_instructions
      head :no_content
    else
      render json: { error: 'Email address does not exist' }, status: :unprocessable_entity
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(
      :name, :email, :password, :phone_number, :graduation_date, :major, :avatar_url
    )
  end
end
