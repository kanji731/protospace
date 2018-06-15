class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: 'new' }), alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
  end

  def edit

  end

  def update
    @prototype.update(update_prototype_params)
    @prototype.captured_images.build
    redirect_to :root
  end

  def destroy
    @prototype.destroy if current_user.id == @prototype.user_id
    redirect_to :root, notice: '削除したよー'
  end

  private

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status]
    )
  end

  def update_prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:content, :status, :_destroy, :id]
    )
  end
end
