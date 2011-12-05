require "savon"

Given /^I am using city (\w+)$/ do |city|
  @city = city
end

When /^I call getAddressFromCity service$/ do
	client = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
	response = client.request :web, :get_info_by_city, body: {"USCity" => @city}
	data = response.to_hash[:get_info_by_city_response][:get_info_by_city_result][:new_data_set][:table]
	@result = {"state"=>data[:state], "areacode"=>data[:area_code], "timezone"=>data[:time_zone], "zip"=>data[:zip]}
	end

Then /^the resulting address should have the following values:$/ do |table|
  expected = table.rows_hash
  @result.should == expected
end