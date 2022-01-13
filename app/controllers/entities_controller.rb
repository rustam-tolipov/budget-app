class EntitiesController < ApplicationController
  def index
    @entities = current_user.entities.where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end

  def new
    @entity = Entity.new
  end

  def create
    @entity = Entity.new(entity_params)
    @entity.user = current_user
    @entity.group = Group.find(params[:group_id])
    if @entity.save
      flash[:success] = 'Entity was successfully created.'
      redirect_to group_entities_path
    else
      flash[:error] = 'Entity was not created.'
      render 'new'
    end
  end

  def destroy
    @entity = Entity.find(params[:id])
    @entity.destroy
    redirect_to group_entities_path(@entity.group)
  end

  private

  def entity_params
    params.require(:entity).permit(:name, :amount)
  end
end
