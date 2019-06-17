//
//  ViewController.swift
//  searchBar
//
//  Created by mac on 14/06/19.
//  Copyright © 2019 gammastack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBarController: UISearchBar!
    
    var array = [["name":"Shubhanshu", "location":"Jablapur"], ["name":"Ritwik", "location":"Sagar"], ["name":"Akshat", "location":"Dewas"], ["name":"aman", "location":"Bhopal"], ["name":"Ayush", "location":"Bhopal"], ["name":"Khatloyiya", "location":"Jablapur"], ["name":"Puneet", "location":"Nagda"], ["name":"Shubham", "location":"Gwalior"],   ["name":"Prannet", "location":"Jablapur"], ["name":"Srajan", "location":"Jablapur"], ["name":"Sansa", "location":"Winterfell"], ["name":"Gendry", "location":"Kings Landing"], ["name":"Tyrion", "location":"Castely Rock"], ["name":"Walder Frey", "location":"Riverrun"]]
    var throughDataModels = [DataModel]()
    var namesInDataModel = [DataModel]()
    var localArrayOfNames = [String]()
    var searchedElement = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        appendingToDataModel()
        searchBarController.delegate = self
        searchBarController.returnKeyType = UIReturnKeyType.done
    }

    func appendingToDataModel() {
        for i in 0...(array.count-1) {
            let dict = array[i]
            self.throughDataModels.append(DataModel(yourName: dict["name"]!, yourCity: dict["location"]!))
            self.namesInDataModel.append(DataModel(yourName: dict["name"]!))
            localArrayOfNames.append(dict["name"]!)
        }
        self.tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            return searchedElement.count
        }
        return namesInDataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if searching {
            cell.nameLabel1.text = searchedElement[indexPath.row]
        } else {
        let model:DataModel = namesInDataModel[indexPath.row]
        cell.nameLabel1.text = model.name
            //cell.nameLabel1.text = localArrayOfNames[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondScreen:secondVC = self.storyboard?.instantiateViewController(withIdentifier: "second") as! secondVC
        if searching {
            
        } else {
        let model: DataModel = throughDataModels[indexPath.row]
        secondScreen.variableForName = model.name
        secondScreen.variableForLocation = model.city
        }
        self.navigationController?.pushViewController(secondScreen, animated: true)
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if ( searchBarController.text == nil || searchBarController.text == "" ) {
            searching = false
            view.endEditing(true)
            tableView.reloadData()
        } else {
        searchedElement = localArrayOfNames.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}



















