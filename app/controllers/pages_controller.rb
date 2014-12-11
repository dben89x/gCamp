class PagesController < PublicController
  def index
    binding pry
  end

  def faq

    faq1 = Faq.new(
    "What is gCamp?",

    "gCamp is an awesome tool that is going to change your life. gCamp is your one stop shop to
    organize all your tasks and documents. You'll also be able to track comments that you and others
    make. gCamp may eventually replace all need for paper and pens in the entire world. Well, maybe
    not, but   it's going to be pretty cool."
    )

    faq2 = Faq.new(
    "How do I join gCamp?",

    "Right now, gCamp is still in production. So, there is not a sign up page open to
    the public... Yet! Your best option is to become super best friends with a gCamp developer. They
    can be found hanging around gSchool during the day and hitting the hottest clubs at night."
    )

    faq3 = Faq.new(
    "When will gCamp be finished?",

    "gCamp is a work in progress. That being said, it should be fully functional by
    December 2014. Functional, but our developers are going to continue to improve the site for the
    foreseeable future. Check in daily for new features and awesome funcitonality. It's going to
    blow your mind. Organization is only (well, will only) be a click away. Amazing!"
    )

    @faqs = [faq1, faq2, faq3]
  end

  def home
    quote1 = Quote.new
    quote1.text = '"If you judge a fish by its ability to climb a tree, it will live its whole life
    believing that it is stupid."'
    quote1.author = ' ― Albert Einstein'

    quote2 = Quote.new
    quote2.text = '“Be yourself; everyone else is already taken.”'
    quote2.author = ' ― Oscar Wilde'

    quote3 = Quote.new
    quote3.text = '"Don\'t walk behind me; I may not lead. Don\'t walk in front of me; I may not
    follow. Just walk beside me and be my friend.”'
    quote3.author =  '― Albert Camus'

    @quotes = [quote1, quote2, quote3]
  end
end
