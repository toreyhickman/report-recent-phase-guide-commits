class Repository
  attr_reader :name, :html_url, :commits

  def initialize(args)
    @name     = args.fetch(:name)
    @html_url = args.fetch(:html_url)
    @commits  = args.fetch(:commits)
  end
end
