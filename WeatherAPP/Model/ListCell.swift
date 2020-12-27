//
//  ListCell.swift
//  WeatherAPP
//
//  Created by Владислав Николаев on 21.12.2020.
//

import UIKit

class ListCell: UITableViewCell {


    class ListCell: UITableViewCell {

        @IBOutlet weak var nameCityLabel: UILabel!
        
        @IBOutlet weak var conditionCityLabel: UILabel!
        
        @IBOutlet weak var tempCityLabel: UILabel!
        
        
        func configure(weather: Weather) {
            
            self.nameCityLabel.text = weather.name
            self.conditionCityLabel.text = weather.conditionString
            self.tempCityLabel.text = weather.temperatureString
        }
    }
}
