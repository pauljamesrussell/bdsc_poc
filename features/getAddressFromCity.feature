# This is a feature to call a web service through Savon and get a response
# language: en
Feature: getAddressFromCity
	In order to find out where someone lives
	As person needing to deliver mail by hand
	I want to be told the details of the City I need to deliver it to when calling the service with a City

	Scenario Outline: Get postal address when submitting state to the getAddressFromCity service
		Given I am using city <city>
		When I call getAddressFromCity service
		Then the resulting addresses should have the following values:
			| city 			| <city>			|
			| state			| <state>			|
			|	zip				|	<zip>				|
			| areacode	| <areacode>	|
			| timezone	| <timezone>	|

		Examples:
			| city 						| state | areacode	| timezone	|	zip				|
			| Wharton					| NJ 		| 973 			| E 				|	07885			|