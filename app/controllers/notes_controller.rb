class NotesController < ApplicationController
  helper_method :notes, :note
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    respond_with notes
  end

  def create
    note = Note.create(note_params)
    respond_with note
  end

  def update
    note.update_attributes(note_params)
    respond_with note
  end

  def destroy
    respond_with note.destroy
  end

  private

  def note_params
    params.permit(:title, :content)
  end

  def notes
    @_notes ||= Note.all
  end

  def note
    @_note ||= notes.find(params[:id])
  end
end
