require_relative '../../helpers/CSVHelper'

class Tasks
  include PageObject

  def sign_in
    @browser.goto "https://magma.redvolcano.uk/pages/login.php"
    @browser.input(id: "email").send_keys "Everest.xu@freestar.io"
    @browser.input(id: "password").send_keys "freestar"
    @browser.input(id: "submit").click!
  end

  def export_list(num_sites,days)
    @browser.div(:xpath => "//a[contains(@href, '/pages/surge.php')]//div[@id='dashboard-item']").click!
    @browser.button(visible_text: "Last #{days} days").click!
    @browser.select_list(id: "country_select").select "United States"
    @browser.span(visible_text: "Export").click!
    @browser.select_list(id: "listLengthExport").select "#{num_sites}"
    @browser.button(:xpath => "//form[@id='exportListForm']//button").click!
    @browser.wait_until{File.exists?("C:/automated_tasks/magma-export.csv")}
  end
end