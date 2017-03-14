require_relative "../spec_helper"

describe GithubClient do
  it "retrieves repository data from GitHub for a given organization repository" do
    stub_request_for_repository("some-org", "some-repo")

    actual   = GithubClient.fetch_repository("some-org", "some-repo")
    expected = JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_repository_response.json"))

    expect(actual).to eq expected
  end
end
