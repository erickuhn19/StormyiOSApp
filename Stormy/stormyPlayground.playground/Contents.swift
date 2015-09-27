//: Playground - noun: a place where people can play

import UIKit
import Foundation

var str = "Hello, playground"



let forecastAPIKey = "a1ad845551d7c354b25a29825b03a654"

let baseURL = NSURL(string: "https://api.forecast.io/forecast/\(forecastAPIKey)/")

let forecastURL = NSURL(string: "37.8267,-122.423", relativeToURL: baseURL)



