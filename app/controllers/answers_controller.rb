class AnswersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search]
  before_action :set_answer, only: [:show, :edit, :update, :destroy]

  def index
    @answer = Answer.includes(:user).order('created_at DESC')
  end

  def search
    @answers = Answer.search(params[:keyword])
  end

  def new
    @answer = Answer.new
  end

  def create
    @answer = Answer.create(answer_params)

    if @answer.save
      redirect_to answers_path
    else
      render :new
    end
  end

  def edit
    redirect_to action: :index unless @answer.user.id == current_user.id
  end

  def show
    @response = Response.new
    @responses = @answer.responses.includes(:user).order('created_at DESC')
  end

  def update
    if @answer.update(answer_params)
      redirect_to answer_path
    else
      render :new
    end
  end

  def destroy
    if current_user.id == @answer.user.id
      @answer.destroy
      redirect_to answers_path
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:title, :image, :question).merge(user_id: current_user.id)
  end

  def set_answer
    @answer = Answer.find(params[:id])
  end
end
