class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.all
  end

  # GET /tags/1
  # GET /tags/1.json
  def show
  end

  # GET /tags/new
  def new
    if view_context.is_admin?
      @tag = Tag.new
    end
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    if view_context.is_admin?
      @tag = Tag.new(tag_params)
      @tag.save!
      respond_with(@tag, :flash => true)
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    if view_context.is_admin?
      @tag.update(tag_params)
      respond_with(@tag, :flash => true)
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    if view_context.is_admin?
      @tag.destroy
      respond_to do |format|
        format.html { redirect_to tags_url }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:name, :description)
    end
end