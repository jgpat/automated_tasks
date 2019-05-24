require 'csv'

class CSVHelper
  def initialize(file_path)
    @list = CSV.read(file_path, headers:true)
  end

  def compare_lists(existing)
    existing_list = CSV.read(existing, headers:true)
    existing_list_urls = existing_list['URL'].to_set

    for i in 0..@list.length
      puts @list['URL'][i] if !(existing_list_urls.include? @list['URL'][i])
    end
  end
end