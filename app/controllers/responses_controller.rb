class ResponsesController < ApplicationController
  def show
    @response = Response.find(params[:id])
    @question = @response.question
  end
  def edit
    @response = Response.find(params[:id])
    @question = @response.question
  end
  def new
    @question = Question.find(params[:question_id])
    @response = @question.responses.new
  end
  def create
    @question = Question.find(params[:question_id])
    @response = @question.responses.new(response_params)
    if @response.save
      flash[:notice] = "Response saved successfully"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Response failed to save"
      render :new
    end
  end
  def update
    @response = Response.find(params[:id])
    @question = @response.question
    @response.update(response_params)
    flash[:notice] = "response updated successfully"
    redirect_to question_path(@question)
  end
  def destroy
    @response = Response.find(params[:id])
    @question = @response.question
    if @response.delete
      flash[:notice] = "Response deleted"
      redirect_to question_path(@question)
    else
      flash[:alert] = "Response failed to delete"
    end
  end
  def upvote
    response = Response.find(params[:id])
    response.update_attribute(:votes, response.votes + 1)
    redirect_to question_path(response.question)
  end
  private
  def response_params
    params.require(:response).permit(:author, :content, :votes, :question_id)
  end
end
