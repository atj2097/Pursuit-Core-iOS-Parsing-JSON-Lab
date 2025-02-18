//
//  ViewController.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var weather = [Weather](){
        didSet {
            tableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        //just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "weather", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        //is a reference to the actual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            //turn contents of file into usable data
            let data = try Data(contentsOf: url)
            //decode data to create episodes
            let weatherFromJSON = try Weather.getWeather(from: data)
            weather = weatherFromJSON
        } catch {
            fatalError("Couldn't get episodes from JSON: \(error)")
        }
        //episodes = whatever we decode from the json file
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell")
        
        cell?.textLabel?.text = weather[indexPath.row].name
//        cell?.detailTextLabel?.text = weather[indexPath.row].description
        return cell!
    }
}

extension ViewController: UITableViewDelegate {}

