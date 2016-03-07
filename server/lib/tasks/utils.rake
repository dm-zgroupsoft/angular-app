namespace :utils do
  desc 'Scrape monitor data from another website'
  task scrape: :environment do
    (1..19).each do |page|
      response = RestClient.get 'https://pcpartpicker.com/parts/monitor/fetch', {params: {mode: :list, xslug: nil, search: nil, page: page}}
      my_hash = JSON.parse(response.to_str)
      doc = Nokogiri::HTML(my_hash['result']['html'])
      doc.css('tr').each do |tr|
        model_and_vendor_name_str = tr.css('td')[1].text
        resolution_str = tr.css('td')[2].text
        size_str = tr.css('td')[3].text
        response_time_str = tr.css('td')[4].text
        is_ips_str = tr.css('td')[5].text
        price_str = tr.css('td')[8].text

        vendor = model_and_vendor_name_str.split(' ')[0].strip
        model = model_and_vendor_name_str.sub(vendor, '').strip
        width, height = resolution_str.split('x').collect { |a| a.strip.to_i }
        size = size_str.to_f
        response_time = response_time_str.empty? ? nil : response_time_str.to_i
        is_ips = is_ips_str == 'Yes'
        price = price_str.empty? ? nil : price_str.to_money.fractional

        new_display = Display.new model: model, response_time: response_time, is_ips: is_ips, price_cents: price, size: size
        manufacturer = Manufacturer.find_by_title(vendor)
        manufacturer = Manufacturer.create title: vendor unless manufacturer
        new_display.manufacturer = manufacturer
        resolution = Resolution.find_by_width_and_height width, height
        resolution = Resolution.create width: width, height: height unless resolution
        new_display.resolution = resolution

        new_display.save!
      end
    end
  end
end
