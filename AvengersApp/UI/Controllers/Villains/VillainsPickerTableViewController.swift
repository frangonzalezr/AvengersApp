//
//  VillainsPickerTableViewController.swift
//  AvengersApp
//
//  Created by Fran González on 02/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class VillainsPickerTableViewController: UITableViewController {
    var cellColors = ["#F28044","#F0A761","#FEC362","#F0BB4C","#E3CB92","#FEA375"]
    var onCompletion: ((_ success: Bool, _ villain: Villains) -> ())?
    let datamanager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 200
        configureTableView()
        loadAllContent()
        showData()
        }
    
    // MARK: Private methods
    
    private var villains: [Villains] = []
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
    }
    private func loadAllContent() {
        villains = datamanager.loadAllVillains()
    }
        
    private func showData() {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    func configureTableView() {
        // Configure tableView delegate and data source
        tableView.delegate = self
        tableView.dataSource = self
        
        // Set footer view for remove empty table view separator lines
        tableView.tableFooterView = UIView()
    }

      override func numberOfSections(in tableView: UITableView) -> Int {
          // #warning Incomplete implementation, return the number of sections
          return 1
      }

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
        return villains.count
      }

      override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          onCompletion?(true, villains[indexPath.row])
          dismiss(animated: true, completion: nil)
      }
      
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "villainsCell", for: indexPath) as! VillainsTableViewCell
          cell.contentView.backgroundColor = UIColor(hexString: cellColors[indexPath.row % cellColors.count])
            
            if indexPath.row < villains.count {
                cell.nameLabel.text = villains[indexPath.row].name
                cell.villainImage.image = UIImage(named: "\(villains[indexPath.row].image ?? "")")
                switch villains[indexPath.row].power {
                case 1:
                    cell.powerStars.image = UIImage(named: "ic_stars_1")
                case 2:
                    cell.powerStars.image = UIImage(named: "ic_stars_2")
                case 3:
                    cell.powerStars.image = UIImage(named: "ic_stars_3")
                case 4:
                    cell.powerStars.image = UIImage(named: "ic_stars_4")
                case 5:
                    cell.powerStars.image = UIImage(named: "ic_stars_5")
                default:
                    cell.powerStars.image = UIImage(named: "ic_stars_0")
                }
            }
            return cell
            }
}
