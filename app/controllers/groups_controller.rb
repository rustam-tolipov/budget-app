class GroupsController < ApplicationController
  before_action :require_user

  def index
    @groups = Group.all
    @entities = current_user.entities.where(group_id: params[:group_id]).order(created_at: :desc)
    current_user.total_expenses = current_user.entities.sum(:amount).round(2)
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
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
    redirect_to groups_path
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon, :color)
  end
end
