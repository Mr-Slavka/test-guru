
  module ApplicationHelper

    def current_year
      DateTime.current.year
    end

    def github_url(author, repo)
      link_to 'Github, TestGuru',
              "https://github.com/#{author}/#{repo}"
    end

  end
