json.extract! message, :id, :sender, :subject, :body, :time_received, :is_note_to_self, :belongs_to, :created_at, :updated_at
json.url message_url(message, format: :json)
