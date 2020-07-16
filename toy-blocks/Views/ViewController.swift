//
//  ViewController.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/13/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

struct Root : Decodable {
    let data : [BlockData]
}
struct BlockData : Decodable {
    let id : String
    let type: String
    let attributes : AttributeData
}
struct AttributeData : Decodable {
    let index : Int
    let timestamp: Int
    let data : String
    let hash: String
}
class TableViewViewController: UITableViewController {
    var tableViewData = [Node]()

    //Sample API Call to get Blocks
    private func getData(url: String, completion: @escaping ((Root) -> Void)) {
      let endpoint = URL(string: "\(url)\(kBlocksApiPath)")!
      let request = URLRequest(url: endpoint)

      let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
          guard let data = data else {
            return
          }
          do {
            let json = try JSONDecoder().decode(Root.self, from: data)
            completion(json);
          } catch {
            print("didnt work \(error).")
          }
      }
      task.resume()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Toy Blocks";
        
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
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NodeTableViewCell") as! NodeTableViewCell
        cell.nameLabel.text = tableViewData[indexPath.section].name
        cell.urlLabel.text = tableViewData[indexPath.section].url
        return cell;
    }

}

