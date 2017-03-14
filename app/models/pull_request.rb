class PullRequest
  attr_reader :title, :html_url, :merged_at

  def initialize(args)
    @title     = args.fetch(:title)
    @html_url  = args.fetch(:html_url)
    @merged_at = args.fetch(:merged_at)
  end
end
