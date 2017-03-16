module Email
  class PlainTextEmail
    def initialize(repositories)
      @repositories = repositories
    end

    def body
<<-BODY
#{Email::Introduction}

#{render_repo_list}
BODY
    end

    private

    def render_repo_list
      ERB.new(template, nil, "-").result(binding).strip
    end

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
end
