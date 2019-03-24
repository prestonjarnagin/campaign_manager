class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
    3.times do
      @campaign.messages.build
    end
  end

  def create
    @campaign = Campaign.new(campaign_params)

    respond_to do |format|
      if @campaign.save
        format.html { redirect_to @campaign, notice: 'Campaign was successfully created.' }
        format.json { render :show, status: :created, location: @campaign }
      else
        format.html { render :new }
        format.json { render json: @campaign.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def campaign_params
      params.require(:campaign).permit(:name)
    end

    def messages
      # TODO: This is probably vulnerable to SQL injections. Is there a Gem that could help?
      # OPTIMIZE: This logic can be broken out of the controller into a seperate class
      temp = []
      params[:campaign][:messages_attributes].each do |message|
        temp << params[:campaign][:messages_attributes][message][:text]
      end
      temp
    end
end
