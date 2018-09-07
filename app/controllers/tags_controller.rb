class TagsController < ApplicationController
  before_action :set_tag, only: [:edit, :update, :destroy]
  before_action :require_login, except: [:index]

  def index
    @tags = Tag.all_sorted
    @ticket_totals = Tag.all_ticket_totals
  end

  def new
    @tag = Tag.new
  end

  def create
    @tag = Tag.new(tag_params)

    if @tag.save
      flash["notice"] = "Tag was successfully created."
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @tag.update(tag_params)
        flash["notice"] = "Tag was successfully updated."
        redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    if @tag.destroy
      flash["notice"] = "Tag was successfully destroyed."
      redirect_to tags_path
    else
      flash["error"] = "Tag was not destroyed."
      render :index
    end
  end

  private

  def tag_params
    params.require(:tag).permit(:name)
  end

  def set_tag
    @tag = Tag.find(params[:id])
  end
end
