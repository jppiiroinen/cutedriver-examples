require "minitest/autorun"
require "tdriver"

class TestDoubleSutPerformanceCompare < Minitest::Test
  def setup
    @sut_one = TDriver.sut('sut_one')
    @sut_one.set_event_type(:Touch)
    @quickapp = @sut_one.run(:name => 'quickapp', :arguments => '-testability')
    minitest_verify_true(5, 'QuickApp is ready for testing.') {
      @quickapp.child('appWindow')['visible'] == 'true'
    }
    @sut_two = TDriver.sut('sut_two')
    @sut_two.set_event_type(:Touch)
    @quickapp_huge = @sut_two.run(:name => 'quickapp-huge', :arguments => '-testability')
    minitest_verify_true(5, 'QuickApp-Huge is ready for testing.') {
      @quickapp_huge.child('appWindow')['visible'] == 'true'
    }
  end

  def test_teststep1
    # TODO: add a check here
  end

  def teardown
    if @app != nil
        @app.kill
    end
  end
end
