module ApplicationHelper
  def serialize(models)
    ActiveModel::ArraySerializer.new(models).to_json
  end
end
