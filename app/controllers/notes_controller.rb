class NotesController < ApplicationController
    before_action :authenticate_user!

    def index
       @notes = current_user.notes
    end
end
