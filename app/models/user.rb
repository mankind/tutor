class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_many :student_request, :class_name => 'Proposal', :foreign_key =>  'tutor_request_id'
   has_many :tutor_request, :class_name => 'Proposal', :foreign_key =>  'student_request_id'

   has_many :enquiries

   enum role: [:tutor, :student, :both]

   ROLE_OPTIONS = %w(tutor student)
   validates :role, :inclusion => {:in => ROLE_OPTIONS}

   acts_as_messageable

   def name
     email
   end

   def mailboxer_email(object)
      email
   end

   def send_message
   end
end
