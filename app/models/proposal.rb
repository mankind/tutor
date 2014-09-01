class Proposal < ActiveRecord::Base

  #notified object is in mailboxer gem
  #https://github.com/mailboxer/mailboxer/blob/master/app/models/mailboxer/notification.rb#L8

  has_many :notified_objects, :foreign_key => 'notified_object_id',  :dependent => :destroy
 
  belongs_to :tutor_request, :class_name => 'User', :foreign_key =>  'tutor_request'
  belongs_to :student_request, :class_name => 'User', :foreign_key =>  'student_request'

   enum status: [:request, :accepted, :pending, :rejected]


   #after_commit :create_notification, on: :create
 
  def create_notification
    subject = "#{student_request.name} "
    body = "#{student_request.name} (#{student_request.email}) needs tutorial."
    tutor_request.notify(subject, body, self)
  end

end
