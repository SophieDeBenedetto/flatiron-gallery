module Adapter
  class GitHubWrapper
    def initialize
      @client ||= Octokit::Client.new(access_token: ENV["OCTO_TOKEN"])
    end

    def get_collaborators(repo)
      @client.collaborators(repo)
    end
  end
end