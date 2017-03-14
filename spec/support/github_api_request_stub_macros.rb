module GithubAPIRequestStubMacros
  def stub_request_for_repository(org_name, repo_name)
    stub_request(:get, "https://api.github.com/repos/#{org_name}/#{repo_name}")
      .with(headers: { "Accept"        => "application/vnd.github.v3+json",
                       "Authorization" => "token #{ENV["GITHUB_TOKEN"]}",
                       "User-Agent"    => "#{APP_NAME} (Ruby)" })
      .to_return(body: File.read("#{APP_ROOT}/spec/fixtures/request_repository_response.json"))
  end
end
