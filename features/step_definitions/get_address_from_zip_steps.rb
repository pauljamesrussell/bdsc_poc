require "savon"

Given /^I am using zip code (\d+)$/ do |zip_code|
  @zip_code = zip_code
end

When /^I call getAddressFromZIP service$/ do
#  @result = {'city' => 'city_actual', 'state' => 'state_actual', 'areacode' => 'areacode_actual', 'timezone' => 'timezone_actual'}
	client = Savon::Client.new("http://www.webservicex.net/uszip.asmx?WSDL")
	response = client.request :web, :get_info_by_zip, body: {"USZip" => @zip_code}
	@result = response.to_hash
	end

Then /^the resulting address should have the following values:$/ do |table|
  expected = table.rows_hash
  @result.should == expected
end