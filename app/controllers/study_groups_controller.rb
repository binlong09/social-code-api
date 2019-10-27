# frozen_string_literal: true

class StudyGroupsController < ApplicationController
  before_action :authorize_request

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
      :photo_url
    )
  end
end
