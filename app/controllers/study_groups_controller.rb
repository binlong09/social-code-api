# frozen_string_literal: true

class StudyGroupsController < ApplicationController
  before_action :authorize_request
  before_action :find_study_group, only: [:show, :update, :going, :not_going, :create_bookmark, :delete_bookmark]

  def index
    @study_groups = StudyGroup.includes(:study_group_memberships).page(params[:page]).per(params[:limit])
    authorize @study_groups
    render json: @study_groups, meta: meta_attributes(@study_groups), meta_key: 'pages',
           root: 'study_groups', inlcude: ['study_group_membership'],
           each_serializer: StudyGroup::IndexSerializer, status: :ok
  end

  def show
    render json: @study_group, serializer: StudyGroup::ShowSerializer, status: :ok
  end

  def create
    authorize StudyGroup
    service = StudyGroups::CreateService.new(current_user, study_group_params)
    if service.call
      render json: service.study_group, serializer: StudyGroup::ShowSerializer, status: :created
    else
      render json: { errors: service.errors.messages }, status: :unprocessable_entity
    end
  end

  def update
    authorize @study_group
    if @study_group.update(study_group_params)
      render json: @study_group, serializer: StudyGroup::ShowSerializer, status: :ok
    else
      render json: { errors: @study_group.errors.messages }, status: :unprocessable_entity
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

  def create_bookmark
    authorize @study_group
    service = StudyGroups::BookmarkUpdateService.new(current_user, true, @study_group)
    if service.call
      head :no_content
    else
      render json: { errors: service.errors.messages }, status: :unprocessable_entity
    end
  end

  def delete_bookmark
    authorize @study_group
    service = StudyGroups::BookmarkUpdateService.new(current_user, false, @study_group)
    if service.call
      head :no_content
    else
      render json: { errors: service.errors.messages }, status: :unprocessable_entity
    end
  end

  def search
    authorize StudyGroup
    @study_groups = StudyGroup.search(params[:q])
    render json: @study_groups, root: 'study_groups', inlcude: ['study_group_membership'],
           each_serializer: StudyGroup::IndexSerializer, status: :ok
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
