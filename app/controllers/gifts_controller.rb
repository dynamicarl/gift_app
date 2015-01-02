class GiftsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
	before_action	:set_gift, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:edit, :update, :destroy, :show]
	
  # GET /gifts
  # GET /gifts.json
  def index
    @gifts = Gift.all
  end

  # GET /gifts/1
  # GET /gifts/1.json
  def show
  end

  # GET /gifts/new
  def new
    @gift = current_user.gifts.build
  end

  # GET /gifts/1/edit
  def edit
  end

  # POST /gifts
  # POST /gifts.json
  def create
    #@gift = Gift.new(gift_params)
		@gift = current_user.gifts.build(gift_params)
		
    #respond_to do |format|
      if @gift.save
				redirect_to @gift, notice: "Gift successfully created"
      else
        format.html { render :new }
      end
    #end
  end

  # PATCH/PUT /gifts/1
  # PATCH/PUT /gifts/1.json
  def update
		if @gift.update(gift_params)
			redirect_to @gift, notice: 'Gift successfully updated.'
		else
			render action: 'edit'
		end
  end

  # DELETE /gifts/1
  # DELETE /gifts/1.json
  def destroy
    @gift.destroy
    respond_to do |format|
      format.html { redirect_to gifts_url, notice: 'Gift was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gift
      @gift = Gift.find(params[:id])
    end

		def correct_user
			@gift = current_user.gifts.find_by(id: params[:id])
			redirect_to gifts_path, notice: "Not authorized to edit this gift" if @gift.nil?
		end
    
		# Never trust parameters from the scary internet, only allow the white list through.
    def gift_params
      params.require(:gift).permit(:description, :item_image, :wrapped_image, :recipient_id, :value)
    end
end
