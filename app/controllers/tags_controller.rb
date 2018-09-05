class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def new
    @tag = Tag.new
  end

  def create
    tag = Tag.new(tag_params)

    if tag.save
      flash["notice"] = "Tag was successfully created."
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
  end

  def update
    tag = Tag.find(params[:id])

    if tag.update(tag_params)
        flash["notice"] = "Tag was successfully updated."
        redirect_to tags_path
    else
      render :edit
    end
  end

  def destroy
    tag = Tag.find(params[:id])

    if tag.destroy
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
end
