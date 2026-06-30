require "test_helper"

class ApplicationJobTest < ActiveSupport::TestCase
  test "application job inherits from ActiveJob::Base" do
    job = ApplicationJob.new
    assert_kind_of ActiveJob::Base, job
  end
end
