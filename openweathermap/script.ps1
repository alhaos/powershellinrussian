<#
        .SYNOPSIS
        Write a script for retrieving weather data from openweathermap.org.
        2. Script is required getting data by city name or city id.
        3. Script is required having possibility to set temperature format (Kelvin, Imperial, Metric).
        4. Script must return hash table with next keys: City, Id, Country, Weather Now, Temperature Now, Weather Tomorrow, Temperature Tomorrow.
        
#>

param (
    [Parameter (Mandatory=$true)]
    [ValidateLength(1,30)]
    [string]$CityNameOrName = 'London',
    [Parameter (Mandatory=$true)]
    [ValidateSet("standard", "metric", "imperial")]
    [string]$TemperatureFormat = "metric",
    [Parameter (Mandatory=$true)]
    [string]$APIKey = "001abf212cdee8941b71ff7eb93a05b1"
)

if ($CityNameOrName -match "/d+"){
    $CityParam = "id=$CityNameOrName"
}
else {
    $CityParam = "q=$CityNameOrName"
}

$ApiCall = "http://api.openweathermap.org/data/2.5/weather?$CityParam&units=$TemperatureFormat&appid=$APIKey"
$Result  = (Invoke-WebRequest $ApiCall).Content
$Result


