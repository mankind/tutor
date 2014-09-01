class ProposalsController < ApplicationController
  before_action :set_proposal, only: [:edit, :show, :update, :destroy, :messages]
  def index
    @proposals = Proposal.all
  end

  def show
  end

  def edit
  end

  def new
    @proposal = Proposal.new
  end

  def create
    @proposal = Proposal.new(proposal_params)
    
  end

  def messages
    #note @proposal is set in the set_proposal
    @messages = Mailboxer::Message.with_object(@proposal)
  end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
  end

  def proposal_request
    params.permit(:proposal).permit(:message)
  end
  

end
