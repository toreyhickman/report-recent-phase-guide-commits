require_relative "../spec_helper"

describe RepositoryBuilder do
  let(:client) { double("client") }
  let(:org_name) { "some-org" }
  let(:repo_name) { "some-repo" }
  let(:builder) { RepositoryBuilder.new(org_name, repo_name, client) }

  let(:built_repository) do
    builder.build_repository_with_merged_pull_requests
  end

  describe "building a repository" do
    before(:each) do
      allow(client).to receive(:fetch_repository).with(org_name, repo_name).and_return(JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_repository_response.json")))
      allow(client).to receive(:fetch_merged_pull_requests).with(org_name, repo_name).and_return(JSON.parse(File.read("#{APP_ROOT}/spec/fixtures/request_merged_pull_requests_response.json")))
    end

    it "builds a repository with a name" do
      expect(built_repository.name).to eq "some-repo"
    end

    it "builds a repository with an html url" do
      expect(built_repository.html_url).to eq "https://github.com/some-org/some-repo"
    end

    describe "building the pull requests" do
      let(:pull_request) { built_repository.pull_requests.first }

      it "builds pull requests with a title" do
        expect(pull_request.title).to eq "some merged feature"
      end

      it "builds pull requests with an html url" do
        expect(pull_request.html_url).to eq "https://github.com/some-org/some-repo/pull/111"
      end
    end
  end
end
