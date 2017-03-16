class RepositoryListPlainTextView
  def initialize(repositories)
    @repositories = repositories
  end

  def render
    ERB.new(template, nil, "-").result(binding).strip
  end

  private

  def template
<<-PLAIN_TEXT
<% @repositories.each do |repo| -%>
<%= repo.name %>
<% repo.pull_requests.each do |pr| -%>
- <%= pr.title %>
<% end -%>

<% end -%>
PLAIN_TEXT
  end
end
