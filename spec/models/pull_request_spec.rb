require_relative "../spec_helper"

describe PullRequest do
  let(:pull_request) do
    PullRequest.new({
      :title     => "new feature",
      :html_url  => "https://github.com/some-org/some-repo/pull/1234",
      :merged_at => Date.parse("2017-01-01")
    })
  end

  it "has a title" do
    expect(pull_request.title).to eq "new feature"
  end

  it "has an html url" do
    expect(pull_request.html_url).to eq "https://github.com/some-org/some-repo/pull/1234"
  end

  it "has a merged at time" do
    expect(pull_request.merged_at).to eq Date.parse("2017-01-01")
  end

  describe "reporting whether it was merged on or after a given date" do
    it "returns true when merged after the date" do
      comparison_date = Date.parse("2016-12-31")

      expect(pull_request.merged_on_or_after?(comparison_date)).to be true
    end

    it "returns true when merged on the date" do
      comparison_date = Date.parse("2017-01-01")

      expect(pull_request.merged_on_or_after?(comparison_date)).to be true
    end
    it "returns false when merged before the date" do
      comparison_date = Date.parse("2017-01-02")

      expect(pull_request.merged_on_or_after?(comparison_date)).to be false
    end
  end
end
