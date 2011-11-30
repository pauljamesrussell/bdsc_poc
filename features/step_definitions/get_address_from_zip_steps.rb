require "savon"

Given /^I am using zip code (\d+)$/ do |zip_code|
  @zip_code = zip_code
end

When /^I call getAddressFromZIP service$/ do
#  @result = {'city' => 'city_actual', 'state' => 'state_actual', 'areacode' => 'areacode_actual', 'timezone' => 'timezone_actual'}
	client = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
	response = client.request :web, :get_info_by_zip, body: {"USZip" => @zip_code}
	data = response.to_hash[:get_info_by_zip_response][:get_info_by_zip_result][:new_data_set][:table]
#	@city = data[:city]
#	@state = data[:state]
#	@area_code = data[:area_code]
#	@time_zone = data[:time_zone]
#	@result = data
	@result = {"city"=>data[:city], "state"=>data[:state], "areacode"=>data[:area_code], "timezone"=>data[:time_zone]}
	end

Then /^the resulting address should have the following values:$/ do |table|
  expected = table.rows_hash
  @result.should == expected
end