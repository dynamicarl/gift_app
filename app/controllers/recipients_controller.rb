class RecipientsController < ApplicationController
  before_action :set_recipient, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
	before_action :correct_user, only: [:edit, :update, :destroy, :show]
	
  respond_to :html

  def index
    @recipients = Recipient.all
    respond_with(@recipients)
  end

  def show
    respond_with(@recipient)
  end

  def new
    @recipient = current_user.recipients.build
    respond_with(@recipient)
  end

  def edit
  end

  def create
		@recipient = current_user.recipients.build(recipient_params)
    #respond_with(@recipient)
			if @recipient.save
				redirect_to @recipient, notice: "Recipient successfully created"
      else
        format.html { render :new }
      end
  end

  def update
		if @recipient.update(recipient_params)
			redirect_to @recipient, notice: 'Recipient successfully updated.'
		else
			render action: 'edit'
    end
  end

  def destroy
    @recipient.destroy
    respond_with(@recipient)
  end

  private
    def set_recipient
      @recipient = Recipient.find(params[:id])
    end

		def correct_user
			@gift = current_user.recipients.find_by(id: params[:id])
			redirect_to recipients_path, notice: "Not authorized to edit this recipient" if @recipient.nil?
		end
		
    def recipient_params
      params.require(:recipient).permit(:name, :birthday)
    end
end
