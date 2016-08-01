require 'test_helper'
require 'stringio'

describe Jekyll::Commands::Kip do
  before do
    Jekyll.logger = Logger.new(StringIO.new)
    @current_path = Dir.pwd
    Dir.chdir(Dir.pwd + '/test/test_site/')
    $stdout = StringIO.new
    $stderr = StringIO.new
  end

  after do
    Dir.chdir(@current_path)
    $stdout = STDOUT
    $stderr = STDERR
  end

  describe 'request is valid' do
    before do
      stubbed_response = { status: 200, content: 'test' }.to_json
      stub_request(:post, "http://kipalog.com/api/v1/post").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'JEKYLLKIP'}).
        to_return(status: 200, body: stubbed_response)
    end

    it 'responds as successful' do
      kip = Jekyll::Commands::Kip
      kip.process(['hello-world'], {})
      assert_equal 'Post "hello-world" posted successfully', $stdout.string.strip
    end
  end

  describe 'multiple post slugs are supported' do
    before do
      stubbed_response = { status: 200, content: 'test' }.to_json
      stub_request(:post, "http://kipalog.com/api/v1/post").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'JEKYLLKIP'}).
        to_return(status: 200, body: stubbed_response)
    end

    it 'responds as successful' do
      kip = Jekyll::Commands::Kip
      kip.process(['hello-world', 'another-post'], {})
      assert_equal "Post \"another-post\" posted successfully\nPost \"hello-world\" posted successfully", $stdout.string.strip
    end
  end

  describe 'request is invalid' do
    before do
      stubbed_response = { status: 401, cause: 'Just an error' }.to_json
      stub_request(:post, "http://kipalog.com/api/v1/post").
        with(headers: {'Accept-Charset'=>'application/json', 'X-Kipalog-Token'=>'JEKYLLKIP'}).
        to_return(status: 200, body: stubbed_response)
    end

    it 'aborts the program' do
      kip = Jekyll::Commands::Kip
      kip.process(['hello-world'], {})
      assert_equal 'Just an error', $stderr.string.strip
    end
  end
end
