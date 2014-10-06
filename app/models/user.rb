class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   has_one :tutor_profile
   has_many :enquiries, dependent: :destroy

   has_many :tutorships_as_tutor, class_name: 'Tutorship', foreign_key: :tutor_id, dependent: :destroy
   has_many :tutors, class_name:  'User', through: :tutorships_as_tutor
    
   has_many :tutorships_as_student, class_name: 'Tutorship', foreign_key: :student_id
   has_many :students, class_name: 'User', through: :tutorships_as_student

   # invites asking this user to be a tutor
   has_many  :pending_invites_to_be_a_tutor,
              -> { Tutorship.invited },
              class_name: "Tutorship",
              foreign_key: :tutor_id

   # agreed tutorships where this user is the tutor
  has_many  :tutorships_as_tutor,
              ->{ Tutorship.accepted },
              class_name: "Tutorship",
              foreign_key: :tutor_id

  
   acts_as_messageable

   def name
     email
   end

   def mailboxer_email(object)
      email
   end

end
