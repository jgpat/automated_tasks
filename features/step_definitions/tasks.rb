Given(/^download new list of top "([^"]*)" trending sites from last (\d+) days$/) do |num_sites, days|
  on(Tasks) do |page|
    page.sign_in
    page.export_list(num_sites,days)
  end
end

Then(/^compare new list with existing list of sites$/) do
  new = "C:/automated_tasks/magma-export.csv"
  existing = "C:/automated_tasks/list.csv"
  new_list = CSVHelper.new(new)
  new_list.compare_lists(existing)
end