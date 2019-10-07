# frozen_string_literal: true

class StudyGroupsController < ApplicationController
  before_action :authorize_request

  def index
    @study_groups = StudyGroup.page(params[:page]).per(params[:limit])
    render json: @study_groups, meta: meta_attributes(@study_groups), meta_key: 'pages',
           root: 'study_groups', status: :ok
  end

  def show
    render json: @study_group, status: :ok
  end

  def create
    @study_group = StudyGroup.new(study_group_params)
    if @study_group.save
      render json: @study_group, status: :created
    else
      render json: { errors: @study_group.errors.full_message },
             status: :unprocessable_entity
    end

  end

  private

  def find_study_group
    @study_group = StudyGroup.find(params[:id])
  end

  def study_group_params
    params.permit(
      :class_code,
      :class_name,
      :location,
      :semester,
      :meeting_time,
      :professor_name,
      :going_count,
      :photo_url
    )
  end
end