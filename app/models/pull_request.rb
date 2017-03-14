class PullRequest
  attr_reader :title, :html_url, :merged_at

  def initialize(args)
    @title     = args.fetch(:title)
    @html_url  = args.fetch(:html_url)
    @merged_at = args.fetch(:merged_at)
  end

  def merged_on_or_after?(date)
    merged_at >= date
  end
end
