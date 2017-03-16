class Repository
  attr_reader :name, :html_url, :pull_requests

  def initialize(args)
    @name           = args.fetch(:name)
    @html_url       = args.fetch(:html_url)
    @pull_requests  = args.fetch(:pull_requests)
  end
end
