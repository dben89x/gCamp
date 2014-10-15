class PagesController < ApplicationController

  def home

    @quotes = []

    quote1 = Quote.new
    quote1.text = '"If you judge a fish by its ability to climb a tree, it will live its whole life believing that
          it is stupid."'
    quote1.author = ' ― Albert Einstein'

    quote2 = Quote.new
    quote2.text = '“Be yourself; everyone else is already taken.”'
    quote2.author = ' ― Oscar Wilde'

    quote3 = Quote.new
    quote3.text = '"Don\'t walk behind me; I may not lead. Don\'t walk in front of me; I may not follow. Just walk
          beside me and be my friend.”'
    quote3.author =  '― Albert Camus'

    @quotes = [quote1,quote2, quote3]

  end

end
