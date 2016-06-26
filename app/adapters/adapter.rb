module Adapter
  class GitHubWrapper
    def initialize
      @client ||= Octokit::Client.new(access_token: ENV["OCTO_TOKEN"])
    end

    def get_contributors(repo)
      @client.contributors(repo)
    end
  end
end