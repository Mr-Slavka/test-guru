
  class GistQuestionService
    Result = Struct.new(:url, :html_url) do
      def success?
        url.present?
      end
    end

    def initialize(question, client = default_client)
      @question = question
      @test = @question.test
      @client = client
    end

    def call
      result = @client.create_gist(gist_params)
      Result.new(result[:html_url])
    end

    def get_a_gist

    end

    private

    def gist_params
      {
        description: I18n.t('gist_question_service.gist_params.description', title: @test.title),
        files: {
          'test-guru-question.txt' => {
            content: gist_content
          }
        }
      }
    end

    def gist_content
      [@question.body, *@question.answers.pluck(:body)].join("\n")
    end

    def default_client
      Octokit::Client.new(access_token: ENV.fetch("GITHUB_ACCESS_TOKEN"))
    end
  end