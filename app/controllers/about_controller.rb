class AboutController <MarketingController
  def index
    @project = Project.all
    @task = Task.all
    @membership = Membership.all
    @user = User.all
    @comment = Comment.all
  end
end
