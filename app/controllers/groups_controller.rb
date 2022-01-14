class GroupsController < ApplicationController
  before_action :require_user
  before_action :require_current_user, only: %i[edit update destroy]

  def index
    @groups = Group.where(user_id: current_user.id).order(created_at: :desc)
    @entities = current_user.entities.where(group_id: params[:group_id]).order(created_at: :desc)
    current_user.total_expenses = current_user.entities.sum(:amount).round(2)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.user_id = current_user.id
    if @group.save
      flash[:success] = 'Group was successfully created.'
      redirect_to groups_path
    else
      flash[:error] = 'Group was not created.'
      render 'new'
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = 'Group was successfully deleted.'
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :color)
  end

  def require_current_user
    @group = Group.find(params[:id])
    if @group.user_id == current_user.id
      true
    else
      flash[:error] = 'You are not authorized to perform this action.'
      redirect_to groups_path
    end
  end
end
