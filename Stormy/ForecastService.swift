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
    
    
    func getForecast(lat: Double, long: Double, completion: (Forecast? -> Void)) {
        if let forecastURL = NSURL(string: "\(lat),\(long)", relativeToURL: forecastBaseURL) {
            let networkOperation = NetworkOperation(url: forecastURL)
            
            networkOperation.downloadJSONFromURL {
                (let JSONDictionary) in
                let forecast = Forecast(weatherDictionary: JSONDictionary)
                completion(forecast)
            }
            
        } else {
            print("could not construct a valid URL")
        }
    }
    

    
    
    
}