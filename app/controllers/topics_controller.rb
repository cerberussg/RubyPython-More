class TopicsController < ApplicationController
  before_action :set_sidebar_topics
  layout 'blog'
  def index
    @topics = Topic.all
  end

  def new
    if logged_in?(:site_admin)
      @topic = Topic.new
    else
      redirect_to root_path, notice: "You are not authorized to view this page!"
    end
  end

  def create
    @topic = Topic.new(topic_params)

    respond_to do |format|
      if @topic.save
        format.html { redirect_to topics_path, notice: 'New topic has been added.' }
      else
        format.html { render :new }
      end
    end
  end

  def show
    @topic = Topic.find(params[:id])

    if logged_in?(:site_admin)
      @blogs = @topic.blogs.recent.page(params[:page]).per(5)
    else
      @blogs = @topic.blogs.published.recent.page(params[:page]).per(5)
    end
  end

  private

    def set_sidebar_topics
      @side_bar_topics = Topic.with_blogs
    end

    def topic_params
      params.require(:topic).permit(:title)
    end
end
