//
//  File.swift
//  WeatherAPP
//
//  Created by Владислав Николаев on 26.12.2020.

import Foundation
import CoreLocation

let networkWeatherManager = NetworkWeatherManager()

func getCityWeather(citiesArray: [String], completionHandler: @escaping (Int, Weather) -> Void) {
    
    for (index, item) in citiesArray.enumerated() {
        
        getCoordinateFrom(city: item) { (coordinate, error) in
            guard let coordinate = coordinate, error == nil else { return }

            networkWeatherManager.fetchWeather(latitude: coordinate.latitude, longitude: coordinate.longitude) { (weather) in
                completionHandler(index, weather)
            }
        }
    }
}

func getCoordinateFrom(city: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
       CLGeocoder().geocodeAddressString(city) { placemark, error in
           completion(placemark?.first?.location?.coordinate, error)
       }
       
   }
