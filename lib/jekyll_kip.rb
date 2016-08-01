require "jekyll_kip/version"
require 'jekyll'
require 'httparty'

module Jekyll
  module Commands
    class Kip < Command
      class << self
        def init_with_program(program)
          program.command(:kip) do |c|
            c.syntax "kip [SLUG]"
            c.description 'Cross-post blog to kip'

            c.action do |args, options|
              process(args, options)
            end
          end
        end

        def process(slugs, opts)
          _site.
            posts.docs.
            select { |doc| slugs.include?(doc['slug']) }.
            each { |doc| _publish_to_kipalog(doc) }
        end

        def _site
          @site ||= Site.new(configuration_from_options({})).tap(&:process)
        end

        def _publish_to_kipalog(document)
          body = {
            title: document.data['title'],
            content: document.content,
            status: 'published',
            tag: (document.data['tags'] || []).join(',')
          }.to_json
          headers = {
            'Accept-Charset' => 'application/json',
            'X-Kipalog-Token' => _site.config['kipalog_api_token']
          }
          request = HTTParty.post(
            'http://kipalog.com/api/v1/post',
            body: body,
            headers: headers
          )

          response = JSON.parse(request.parsed_response, symbolize_names: true)

          if response[:status] != 200
            $stderr.puts response[:cause]
          else
            $stdout.puts "Post \"#{document.data['slug']}\" posted successfully"
          end
        end
      end
    end
  end
end
