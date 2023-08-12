//
//  WeatherManager.swift
//  Clima App
//
//  Created by Danila Bolshakov on 13.04.2022.
//

import Foundation
import UIKit
import CoreLocation

protocol WeatherManagerDelegate {
    func didUpdateWeather(weather: WeatherModel)
    func didFailWithError(error: Error)
}

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(Constants.id)&units=metric"
    
    var delegate: WeatherManagerDelegate?
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(with: urlString)
    }
    
    func fetchWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        
        // 1. Create a URL
        guard let url = URL(string: urlString) else { return }
        
        // 2. Create a URLSession
        let session = URLSession(configuration: .default)
        
        // 3. Give the session a task
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error = error  {
                delegate?.didFailWithError(error: error)
                return
            }
            
            guard let safeData = data else { return }
            guard let weather = parseJSON(safeData) else { return }
            delegate?.didUpdateWeather(weather: weather)
        }
        
        // 4. Start the task
        task.resume()
    }
    
    func parseJSON(_ wearheData: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            print("weatherData: \(wearheData)")
            
            if let jsonResponse = String(data: wearheData, encoding: String.Encoding.utf8) {
                print("Response: \(jsonResponse)") //проверка
            }
            
            let decodedData = try decoder.decode(WeatherData.self, from: wearheData)
            
//            let id = decodedData.weather[0].id
//            let temp = decodedData.main.temp
//            let name = decodedData.name
//
//            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp)
            
            let weather = WeatherModel(weatherData: decodedData)
            
            return weather
        } catch let errorNew {
            delegate?.didFailWithError(error: errorNew)
            return nil
        }
    }
}
