class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def create
    begin
      Contact.create!(contact_params)
      redirect_to contacts_path
    rescue
      flash[:error] = 'Error'
      @contact = Contact.new
      redirect_to new_contact_path
    end
  end

  def new
    @contact = Contact.new
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :internal_name, :phone_number)
  end

end
