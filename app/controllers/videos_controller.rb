class VideosController < ApplicationController
  before_action :authenticate_maker!, except: [:index, :show, :like]
  before_action :set_video,           only:   [:edit, :show, :destroy, :update]
  before_action :check_access,        only:   [:edit, :destroy, :update]


  def index
    @videos = Video.order(created_at: :desc).page(params[:page])
  end

  def show
    if signed_in?
      @comments = @video.comments.where.not(id: nil)
      @comment  = @video.comments.build
    else
      flash.now[:alert] = 'You need to sign-in to comment or vote'
    end
  end

  def my_videos
    @videos = current_maker.videos.order(created_at: :desc).page(params[:page])
  end

  def new
    @video = Video.new
  end

  def edit
  end

  def create
    @video = Video.create(video_params)
    if @video.valid?
      redirect_to my_videos_path, notice: 'You have uploaded a new video!'
    else
      render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to my_videos_path, notice: 'You have updated your video!'
    else
      render :edit
    end
  end

  def destroy
    @video.video.clear
    @video.destroy
    redirect_to my_videos_path, notice: 'You have deleted your video!'
  end

  def like
    @video = Video.find(params[:video_id])
    @voter = params[:voter_model].constantize.find(params[:voter_id])

    if @voter.voted_for? @video
      @video.unliked_by @voter
    else
      @video.liked_by @voter
    end

    @likes_count = @video.votes_for.size

    respond_to do |format|
      format.js
    end
  end

  private

  def set_video
    @video = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:title, :maker_id, :description, :video)
  end

  def check_access
    if Video.find(params[:id]).maker_id == current_maker.id
      true
    else
      redirect_to root_path
      flash[:alert] = 'Access denied!'
    end
  end
end
