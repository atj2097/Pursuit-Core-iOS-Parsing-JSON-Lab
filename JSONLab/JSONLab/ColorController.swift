//
//  ColorController.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class ColorController: UIViewController {

    @IBOutlet weak var colorTableView: UITableView!
    var color = [Colors](){
        didSet {
            colorTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    
    private func loadData() {
        //just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "colors", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        //is a reference to the actual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            //turn contents of file into usable data
            let data = try Data(contentsOf: url)
            //decode data to create episodes
            let colorsFromJSON = try Colors.getColors(from: data)
            color = colorsFromJSON
        } catch {
            fatalError("Couldn't get episodes from JSON: \(error)")
        }
        //episodes = whatever we decode from the json file
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ColorController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return color.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "colorCell")
        
        cell?.textLabel?.text = color[indexPath.row].name
        cell?.backgroundColor = UIColor(red: CGFloat(color[indexPath.row].r / 255), green: CGFloat(color[indexPath.row].g / 255), blue: CGFloat(color[indexPath.row].b / 255), alpha: CGFloat(1.0))
        return cell!
    }
    
    
}
