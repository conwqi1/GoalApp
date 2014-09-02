class GoalsController < ApplicationController
  
  def new
    @goal = Goal.new
    render :new
  end
  
  def create
    @goal = Goal.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash.now[:errors] = @goal.errors.full_messages
      redirect_to goals_url
    end
  end
  
  def index
    @goals = Goal.all
    render :index
  end
  
  def edit
    @goal = Goal.find_by(params[id])
    render :edit
  end
  
  def show
    @goal = Goal.find_by(params[id])
  end
  
  def destroy
    @goal = Goal.find_by(params[id])
    @goal.destroy
    redirect_to goals_url
  end
  
  def update
    @goal = Goal.find_by(params[id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      render :edit
    end
  end
  
  def goal_params
    params.require(:goal).permit(:body, :private, :user_id)
  end
end
