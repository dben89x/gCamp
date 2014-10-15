class PagesController < ApplicationController

  def home
    @quotes = ['"If you judge a fish by its ability to climb a tree, it will live its whole life believing that it
          is stupid." ― Albert Einstein',
            '“Be yourself; everyone else is already taken.” ― Oscar Wilde',
            '"Don\'t walk behind me; I may not lead. Don\'t walk in front of me; I may not follow. Just walk
          beside me and be my friend.” ― Albert Camus']
  end

end
