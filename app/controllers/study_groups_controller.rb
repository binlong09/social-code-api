# frozen_string_literal: true

class StudyGroupsController < ApplicationController
  before_action :authorize_request
  before_action :find_study_group, only: [:show, :update, :going, :not_going]

  def index
    @study_groups = StudyGroup.page(params[:page]).per(params[:limit])
    authorize @study_groups
    render json: @study_groups, meta: meta_attributes(@study_groups), meta_key: 'pages',
           root: 'study_groups', inlcude: ['study_group_membership'], status: :ok
  end

  def show
    render json: @study_group, status: :ok
  end

  def create
    authorize StudyGroup
    service = StudyGroups::CreateService.new(current_user, study_group_params)
    if service.call
      render json: service.study_group, status: :create
    else
      render json: { errors: service.errors.message }, status: :unprocessable_entity
    end
  end

  def update
    authorize @study_group
    if @study_group.update(study_group_params)
      render json: @study_group, status: :ok
    else
      render json: { errors: @study_group.errors.message }, status: :unprocessable_entity
    end
  end

  def going
    authorize @study_group
    service = StudyGroups::AttendanceUpdateService.new(current_user, true, @study_group)
    if service.call
      head :no_content
    else
      render json: { errors: service.errors.messages }, status: :unprocessable_entity
    end
  end

  def not_going
    authorize @study_group
    service = StudyGroups::AttendanceUpdateService.new(current_user, false, @study_group)
    if service.call
      head :no_content
    else
      render json: { errors: service.errors.messages }, status: :unprocessable_entity
    end
  end

  private

  def find_study_group
    @study_group = StudyGroup.find(params[:id])
  end

  def study_group_params
    params.permit(
      :class_code,
      :study_group_name,
      :location,
      :semester,
      :meeting_time,
      :professor_name,
      :going_count,
      :image_url
    )
  end
end
