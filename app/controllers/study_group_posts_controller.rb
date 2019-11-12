#frozen_string_literal: true

class StudyGroupPostsController < ApplicationController
  before_action :authorize_request
  before_action :find_study_group, only: [:index, :create]
  before_action :find_post, only: [:update, :destroy, :show]

  def index
    @study_group_posts = list_posts.page(params[:page]).per(params[:limit])
    authorize @study_group_posts
    render json: @study_group_posts, meta: meta_attributes(@study_group_posts), meta_key: 'pages',
           root: 'study_group_posts', each_serializer: StudyGroupPost::IndexSerializer, status: :ok
  end

  def show
    render json: @study_group_post, serializer: StudyGroupPost::ShowSerializer, status: :ok
  end

  def create
    authorize StudyGroupPost
    @study_group_post = @study_group.study_group_posts.build(post_params.merge(user: current_user))
    if @study_group_post.save
      render json: @study_group_post, status: :created
    else
      render json: { errors: @study_group_post.errors.full_message },
             status: :unprocessable_entity
    end
  end

  def update
    if @study_group_post.update(post_params)
      render json: @study_group_post, status: :ok
    else
      render json: { errors: @study_group_post.errors.full_message },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @study_group_post.destroy
      head :no_content
    else
      render json: { errors: @study_group_post.errors.full_message },
             status: :unprocessable_entity
    end
  end

  private

  def find_study_group
    @study_group = StudyGroup.find(params[:study_group_id])
  end

  def list_posts
    @study_group_posts = @study_group.study_group_posts
  end

  def find_post
    @study_group_post = StudyGroupPost.find(params[:id])
  end

  def post_params
    params.permit(:content, :image_url)
  end

end