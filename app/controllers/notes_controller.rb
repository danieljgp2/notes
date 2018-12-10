class NotesController < ApplicationController
    before_action :authenticate_user!

    def index
        @note = Note.new
        filter = params[:filter]
        @notes = filter ? 
            current_user.notes.where('notes.title ILIKE ? or notes.content ILIKE ?', "%#{filter}%", "%#{filter}%").order(created_at: :desc) : 
            current_user.notes.order(created_at: :desc)
    end

    def search
        redirect_to notes_path(filter: params[:search][:filter])
    end

    def create
        redirect_to notes_path, notice: 'Note created!', alert: 'success' and return if current_user.notes.create(notes_params)
        redirect_to notes_path, notice: 'Something went wrong!', alert: 'warning'
    end

    def destroy
        note = Note.find_by_id(params[:id])
        redirect_to notes_path, notice: 'Note destroyed!', alert: 'success' and return if note.destroy
        redirect_to notes_path, notice: 'Something went wrong!', alert: 'warning'
    end

    def update
        note = Note.find_by_id(params[:id])
        redirect_to notes_path, notice: 'Note updated!', alert: 'success' and return if note.update(notes_params)
        redirect_to notes_path, notice: 'Something went wrong!', alert: 'warning'
    end

    private

    def notes_params
        params.require(:note).permit(:title, :content)
    end
end
