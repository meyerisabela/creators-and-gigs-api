class Api::V1::CreatorsController < Api::V1::BaseController
  def index
    sort = %w[first_name last_name].include?(params[:sort]) ? params[:sort] : 'first_name'
    sort_direction = params[:sort_direction] if %w[asc desc].include?(params[:sort_direction])
    limit = params[:limit] if a_integer?(params[:limit])
    offset = params[:offset] if a_integer?(params[:offset])

    @creators = Creator.all.order("#{sort} #{sort_direction}").limit(limit).offset(offset)
  end

  def show
    @creator = Creator.find(params[:id])
  end

  def create
    @creator = Creator.new(creator_strong_params)

    if @creator.save
      render :show, status: :created
    else
      render json: { errors: @creator.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def a_integer?(params)
    /\A[-+]?\d+\z/.match?(params)
  end

  def creator_strong_params
    params.require(:creator).permit(:first_name, :last_name)
  end
end
