class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :updated_at

  has_one :body, polymorphic: true
end
