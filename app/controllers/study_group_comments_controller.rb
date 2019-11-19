# frozen_string_literal: true

class StudyGroupCommentsController < ApplicationController
  before_action :authorize_request
  before_action :find_comment, only: %i[destroy update]
  before_action :find_post, only: [:create, :index]

  def index
    @study_group_comments = list_comments.page(params[:page]).per(params[:limit])
    authorize @study_group_comments
    render json: @study_group_comments, meta: meta_attributes(@study_group_comments),
           meta_key: 'pages', root: 'study_group_comments', each_serializer: CommentSerializer, status: :ok
  end

  def create
    authorize StudyGroupComment
    @study_group_comment = @study_group_post.study_group_comments
                                            .build(comments_params.merge(user: current_user))
    if @study_group_comment.save
      render json: @study_group_comment, status: :created
    else
      render json: { errors: @study_group_comment.errors.full_message },
             status: :unprocessable_entity
    end
  end

  def update
    if @study_group_comment.update(comments_params)
      render json: @study_group_comment, status: :ok
    else
      render json: { errors: @study_group_comment.errors.full_message },
             status: :unprocessable_entity
    end
  end

  def destroy
    if @study_group_comment.destroy
      head :no_content
    else
      render json: { errors: @study_group_comment.errors.full_message },
             status: :unprocessable_entity
    end
  end

  private

  def list_comments
    @study_group_comments = @study_group_post.study_group_comments
  end

  def find_comment
    @study_group_comment = StudyGroupComment.find(params[:id])
  end

  def find_post
    @study_group_post = StudyGroupPost.find(params[:study_group_post_id])
  end

  def comments_params
    params.permit(:content, :image_url)
  end
end
