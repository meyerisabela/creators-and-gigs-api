class Api::V1::GigsController < Api::V1::BaseController
  before_action :set_gig, only: %i[show update]

  def index
    brand_name = params[:brand_name] if params[:brand_name]
    creator_first_name = params[:creator_first_name] if params[:creator_first_name]
    creator_last_name = params[:creator_last_name] if params[:creator_last_name]

    if brand_name
      @gigs = Gig.where(brand_name: brand_name)
    elsif creator_first_name || creator_last_name
      if creator_first_name && creator_last_name
        creator = Creator.find_by(first_name: creator_first_name, last_name: creator_last_name)
      elsif creator_first_name
        creator = Creator.find_by(first_name: creator_first_name)
      elsif creator_last_name
        creator = Creator.find_by(last_name: creator_last_name)
      end
      @gigs = Gig.where(creator: creator)
    else
      @gigs = Gig.all
    end
  end

  def show
    @gig_payment = @gig.gig_payment
  end

  def create
    # creator.create_gig(params())
    @gig = Gig.new(gig_strong_params)
    creator = Creator.find(params[:creator_id])
    @gig.creator = creator

    # @gig.save! --> rescue (base controller)
    if @gig.save
      render :show, status: :created
    else
      render json: { errors: @gig.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @gig.update(gig_strong_params)
      render :show, status: :created
    else
      render json: { errors: @gig.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_gig
    @gig = Gig.find(params[:id])
  end

  def gig_strong_params
    params.require(:gig).permit(:brand_name, :state)
  end
end
