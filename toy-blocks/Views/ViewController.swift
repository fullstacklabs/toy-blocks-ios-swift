//
//  ViewController.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

class TableViewViewController: UITableViewController {
    var tableViewData = [Node]()

//    private func getData(url: String) {
//        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { data, response, error in
//
//            guard let data = data, error == nil else {
//                print("error occurred");
//                return;
//            }
//            var result: Response?
//            do {
//                result = JSONDecoder().decode(Response.self, from: data )
//            }
//            catch {
//                print("failed `\(error.localizedDescription)")
//            }
//            guard let json = result else {
//                return
//            }
//            print(json);
//         })
//         task.resume()
//    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let node1 = Node(url: "https://thawing-springs-53971.herokuapp.com", name: "Thawing Springs")
        let node2 = Node(url: "https://secret-lowlands-62331.herokuapp.com", name: "Secret Lowlands")
        let node3 = Node(url: "https://calm-anchorage-82141.herokuapp.com", name: "Calm Anchorage")
        let node4 = Node(url: "http://localhost:3002", name: "Node 4")

        tableViewData = [node1, node2, node3, node4]
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewData.count;
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableViewData[section].open == true {
            return tableViewData[section].blocks.count + 1
        } else {
            return 1
        }
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NodeTableViewCell") as! NodeTableViewCell
            cell.nameLabel.text = tableViewData[indexPath.section].name
            cell.urlLabel.text = tableViewData[indexPath.section].url
            return cell;
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "NodeCell") else { return UITableViewCell() }
            cell.textLabel?.text = tableViewData[indexPath.section].blocks[indexPath.row - 1].data
            return cell;
        }
    }
}

