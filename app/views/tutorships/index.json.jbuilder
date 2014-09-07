json.array!(@tutorships) do |tutorship|
  json.extract! tutorship, :id, :tutor_id, :student_id, :status, :message, :subject
  json.url tutorship_url(tutorship, format: :json)
end
