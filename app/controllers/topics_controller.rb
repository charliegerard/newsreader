class TopicsController < ApplicationController
  def index
    @topic = Topic.all
  end

  def create
    topic = Topic.new params[:topic]
    topic.user_id = @current_user.id
    topic.save
    redirect_to topics
  end

  def new
  
  end

  def edit
    @topic = Topic.find params[:id]
  end

  def show
    @topic = Topic.find params[:id]
  end

  def update
    topic = Topic.find params[:id]
    topic.update_attributes params[:topic]
    redirect_to topic
  end

  def destroy
    topic = Topic.find params[:id]
    topic.destroy
    redirect_to home
  end
end
