require "minitest/autorun"
require "tdriver"

class TestDoubleSutPerformanceCompare < Minitest::Test
  def setup
    @sut = TDriver.sut(ENV['QTTASSERVER_SUT'] || 'sut_qt')
    @sut.set_event_type(:Touch)
    @quickapp = nil
    if ENV['APP_NAME']
      @quickapp = @sut.application(:name => ENV['APP_NAME'])
    else
      @quickapp = @sut.run(:name => 'quickapp', :arguments => '-testability')
    end
    minitest_verify_true(5, 'QuickApp is ready for testing.') {
      @quickapp.child(ENV['APP_MAINWINDOW'] || 'appWindow')['visible'] == 'true'
    }
   
  end

  def test_gpuusage
    puts @sut.gpu_usage().inspect()
  end

  def test_gpuapps
    puts @sut.gpu_apps().inspect()
  end

  def test_gpuversion
    puts @sut.gpu_version().inspect()
  end

  def test_gpumem
    puts @sut.gpu_mem().inspect()
  end

  def test_gpuinfo
    puts @sut.gpu_info().inspect()
  end

  def teardown
    if @app != nil
        @app.kill
    end
  end
end
