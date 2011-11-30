# This is a feature to call a web service through Savon and get a response
# language: en
Feature: getAddressFromZIP
	In order to find out where someone lives
	As person needing to deliver mail by hand
	I want to be told the postal address when calling the service with a zipcode

	Scenario Outline: Get postal address when submitting zipcode to the getAddress service
		Given I am using zip code <zipcode>
		When I call getAddressFromZIP service
		Then the resulting address should have the following values:
			| city 			| <city>			|
			| state			| <state>			|
			| areacode	| <areacode>	|
			| timezone	| <timezone>	|

		Examples:
			| zipcode | city 						| state | areacode	| timezone	|
			| 90210		| Beverly Hills		| CA 		| 310 			| P 				|
			| 12301 	| Schenectady 		| NY 		| 518				| E 				|
			| 90101 	| Los Angeles 		| CA 		| 213 			| P 				|