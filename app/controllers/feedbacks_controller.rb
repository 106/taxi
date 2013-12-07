class FeedbacksController < ApplicationController
  before_action :set_feedback, only: [:show, :edit, :update, :destroy]

  def index
    @feedbacks = Feedback.all
  end

  def show
  end

  def new
    @feedback = Feedback.new
  end

  def edit
  end

  def create
    @feedback = Feedback.new(feedback_params)
    if @feedback.save
      format.html { redirect_to @feedback, notice: 'Feedback was successfully created.' }
    else
      format.html { render action: 'new' }
    end
  end

  def update
    respond_to do |format|
      format.html { redirect_to @feedback, notice: 'Feedback was successfully updated.' }
    else
      format.html { render action: 'edit' }
    end
  end

  def destroy
    @feedback.destroy
    redirect_to feedbacks_url
  end

  private
    def set_feedback
      @feedback = Feedback.find(params[:id])
    end

    def feedback_params
      params.require(:feedback).permit(:user_id, :taxi_id, :rank, :comment)
    end
end
