require 'watir'

prefs = {
    download: {
        prompt_for_download: false,
        default_directory: 'C:/automated_tasks'
    }
}

Before do |scenario|
  DataMagic.load_for_scenario(scenario)
  @browser = Watir::Browser.new :chrome, options: {prefs: prefs}
end


After do
  @browser.close
end