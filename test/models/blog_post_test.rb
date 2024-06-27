require "test_helper"

class BlogPostTest < ActiveSupport::TestCase
  test "draft? returns true for draft blog post" do
    binding.irb
    assert BlogPost.new(published_at: nil).draft?
  end

  test "draft? returns false for published blog post" do
      refute BlogPost.new(published_at: 1.year.ago).draft?
  end

  test "draft? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
  end
end
