class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
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

  def campaign_ids
    (params[:campaign_ids]||[]).map(&:to_i)
  end

end
