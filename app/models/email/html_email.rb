module Email
  class HTMLEmail
    def initialize(repositories)
      @repositories = repositories
    end

    def body
<<-BODY
<h1>Recent Phase Guide Updates</h1>
<p>#{Email::Introduction}</p>

#{render_repo_list}
BODY
    end

    private

    def render_repo_list
      ERB.new(template, nil, "-").result(binding).strip
    end

    def template
<<-HTML
<% @repositories.each do |repo| -%>
<h2><%= repo.name %></h2>
<ul>
<% repo.pull_requests.each do |pr| -%>
<li><a href="<%= pr.html_url %>"><%= pr.title %></a></li>
<% end -%>
</ul>
<% end -%>
HTML
    end
  end
end
