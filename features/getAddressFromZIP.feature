# This is a feature to call a web service through Savon and get a response
# language: en
Feature: getAddressFromZIP
	In order to find out where someone lives
	As person needing to deliver mail by hand
	I want to be told the postal address when calling the service with a zipcode

	Scenario Outline: Get postal address when submitting zipcode to the getAddress service
		Given I have entered <input_1> into the web service
		When I press call the getAddress service
		Then the <city>, <state>, <areacode> and <timezone> should be displayed on the screen

	Examples:
		| input_1 | city | state | areacode | timezone |
		| 90210 | Beverley Hills | CA | 310 | P |
		| 12301 | Schenectady | NY | 518 | E |
		| 90101 | Los Angeles | CA | 213 | P |