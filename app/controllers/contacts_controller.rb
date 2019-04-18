class ContactsController < ApplicationController

    before_action :require_login

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end
  def create
    begin
      contact = Contact.create!(contact_params)
      contact.add_campaigns(campaign_ids)
      redirect_to contacts_path
    rescue
      flash[:error] = 'Error'
      @contact = Contact.new
      redirect_to new_contact_path
    end
  end

  def new
    @campaigns = Campaign.all
    @contact = Contact.new
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :internal_name, :phone_number)
  end

  # TODO: This logic should probably be pushed out to the model.
  # Pass params[:campaign_ids] to it (may be nil) and have to model fail gracefully
  def campaign_ids
    (params[:campaign_ids]||[]).map(&:to_i)
  end

end
