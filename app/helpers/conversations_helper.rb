module ConversationsHelper

  def fetch_sender_name(conversation)
    a = conversation.participants do |participant|
      if participant != current_user
         logger.debug("fetch sender: #{participant.name.inspect}")
          
         participant
      end
    end
    a
  end

  def check_if_participant_is_current_user? (conversation)
    
    conversation.participants.each do |participant | 
        logger.debug("mr participant: #{participant}")
        logger.debug("mr current: #{current_user}")
         if participant != current_user
           logger.debug("mr current: #{participant.name.inspect}")
           true
         end
          
    end
  end

end
