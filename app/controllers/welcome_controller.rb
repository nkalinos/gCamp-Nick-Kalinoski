class WelcomeController < MarketingController
  def index
    @quotes = {"Cayla Hayes" => "gCamp has changed my life!","Leta Jaskolski" => "Before gCamp I was a disorderly slob.  Now I'm more organized than I've ever been","Lavern Upton" => "Don't hesitate - sign up right now! You'll never be the same."}
  end


end
