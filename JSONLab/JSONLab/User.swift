//
//  User.swift
//  JSONLab
//
//  Created by God on 8/27/19.
//  Copyright © 2019 God. All rights reserved.
//

import UIKit

class User: UIViewController {

    
    
    @IBOutlet weak var userTableView: UITableView!
    var users = [Users](){
        didSet {
            userTableView.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        // Do any additional setup after loading the view.
    }
    private func loadData() {
        //just the string for the name of the file
        guard let pathToJSONFile = Bundle.main.path(forResource: "randomUsers", ofType: "json") else {
            fatalError("couldn't find json file")
        }
        print(pathToJSONFile)
        //is a reference to the actual location of the json file
        let url = URL(fileURLWithPath: pathToJSONFile)
        do {
            //turn contents of file into usable data
            let data = try Data(contentsOf: url)
            //decode data to create episodes
            let usersFromJSON = try Users.getUsers(from: data)
            users = usersFromJSON
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

extension User: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell")
        
        cell?.textLabel?.text = users[indexPath.row].username
        cell?.detailTextLabel?.text = "\( users[indexPath.row].age)"
        return cell!
    }
}
    

