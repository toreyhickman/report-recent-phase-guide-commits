require_relative "../spec_helper"

describe PullRequest do
  let(:pull_request) do
    PullRequest.new({
      :title    => "new feature",
      :html_url => "https://github.com/some-org/some-repo/pull/1234"
    })
  end

  it "has a title" do
    expect(pull_request.title).to eq "new feature"
  end

  it "has an html url" do
    expect(pull_request.html_url).to eq "https://github.com/some-org/some-repo/pull/1234"
  end
end
