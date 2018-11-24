class Api::V1::StoriesController < Api::V1::BaseController
  before_action :set_story, only: [ :show ]
  def index
    @stories = Story.all
    # render json: @stories
  end

  def show
  end

  private

  def set_story
    @story = Story.find(params[:id])
    # render json: @story
  end

  def story_params
    params.require(:story).permit(:name, :text)
  end

  def render_error
    render json: { errors: @story.errors.full_messages },
    status: :unprocessable_entity
  end
end
