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

  private

  def find_study_group
    @study_group = StudyGroup.find(params[:id])
  end
end