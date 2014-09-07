class Tutorship < ActiveRecord::Base
  belongs_to :tutor, class_name: 'User'
  belongs_to :student, class_name: 'User'

  

   #STATUS_OPTIONS = %w(pending accepted rejected)
   #validates :status, :inclusion => {:in => STATUS_OPTIONS}

  #custom scopes to query the enum columns, you would have to pass 
  #the integers instead of the symbols

   enum status:  %w(pending invited accepted rejected)

#Tutorship.accepted           # => a scope to find all acceptedd Tutorships
#Tutorship.accepted?          # => check if Tutorship has the status :accepted
#Tutorship.accepted!          # => update! the Tutorship with status set to :accepted
#Tutorship.status             # => a symbol describing the Tutorship's status
#Tutorship.status = :accepted # => set the Tutorship's status to :accepted


end
