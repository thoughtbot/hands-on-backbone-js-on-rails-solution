class NotesController < ApplicationController
  helper_method :notes, :note
  respond_to :json, only: [:index, :create, :update, :destroy]
  respond_to :html, only: [:index]

  def index
    respond_with notes
  end

  def create
    note = Note.new
    save_note(note)
    respond_with note
  end

  def update
    save_note(note)
    respond_with(note) do |format|
      format.json { render json: note }
    end
  end

  def destroy
    respond_with note.destroy
  end

  private

  def save_note(note)
    note_form = NoteForm.new(note, params)
    note_form.save
  end

  def notes
    @_notes ||= Note.all
  end

  def note
    @_note ||= notes.find(params[:id])
  end
end
