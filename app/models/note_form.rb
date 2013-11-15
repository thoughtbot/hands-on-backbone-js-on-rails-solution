class NoteForm < Struct.new(:note, :params)
  def save
    note.body ||= body_class.new
    note.attributes = note_attributes
    note.body.attributes = permitted_body_attributes
    note.save
  end

  private

  def body_type
    params[:body][:type]
  end

  def body_class
    body_type.classify.constantize
  end

  def note_attributes
    params.permit(:title)
  end

  def normalized_body_attributes
    if body_type == "todo_list"
      body_attributes[:todo_items_attributes] = body_attributes.delete(:todo_items)
    end
    body_attributes
  end

  def permitted_body_attributes
    normalized_body_attributes.permit(*permitted_attributes[body_type])
  end

  def body_attributes
    params.require(:body).require(body_type)
  end

  def permitted_attributes
    {
      "sticky_note" => [:content],
      "todo_list" => [todo_items_attributes: [:id, :title, :complete]]
    }
  end
end
