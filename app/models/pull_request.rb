class PullRequest
  attr_reader :title, :html_url

  def initialize(args)
    @title     = args.fetch(:title)
    @html_url  = args.fetch(:html_url)
  end
end
