//
//  ForecastService.swift
//  Stormy
//
//  Created by Eric Kuhn on 9/22/15.
//  Copyright (c) 2015 Eric Kuhn. All rights reserved.
//

import Foundation


struct ForecastService {
    
    let forecastAPIKey: String
    let forecastBaseURL: NSURL?
    
    init(APIkey: String) {
        forecastAPIKey = APIkey
        forecastBaseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")
    }
    
    
    func getForecast(lat: Double, long: Double, completion: (CurrentWeather? -> Void)) {
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            let networkOperation = NetworkOperation(url: forecastURL)
            
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let currentWeather = self.currentWeatherFromJSONDictionary(JSONDictionary)
                completion(currentWeather)
            }
            
        } else {
            println("could not construct a valid URL")
        }
    }
    
    func currentWeatherFromJSONDictionary(jsonDictionary: [String: AnyObject]?) -> CurrentWeather? {
        
        if let currentWeatherDictionary = jsonDictionary?["currently"] as? [String: AnyObject] {
            return CurrentWeather(weatherDictionary: currentWeatherDictionary)
        } else {
            println("JSON dictionary returned nil for currently key")
            return nil
        }
        
    }
    
    
    
}