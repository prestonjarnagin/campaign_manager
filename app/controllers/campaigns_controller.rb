class CampaignsController < ApplicationController

  def index
    @campaigns = Campaign.all
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.save!
    redirect_to campaigns_path
  end

  def show
    @campaign = Campaign.find(params[:id])
  end

  private
    def campaign_params
      params.require(:campaign)
      .permit(:name, :messages_attributes => [:text, :elapse_minutes, :_destroy])
    end
end
