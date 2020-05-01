//
//  HeroesPickerTableViewController.swift
//  AvengersApp
//
//  Created by Fran González on 01/05/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class HeroesPickerTableViewController: UITableViewController {
    var cellColors = ["#264f96","#6893d9","#367beb","#6893d9","#97b1db","#a3bce6"]
    var onCompletion: ((_ success: Bool, _ hero: Heroes) -> ())?
    let datamanager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 200
        configureTableView()
        loadAllContent()
        showData()
    }
    
    // MARK: Private methods
    
    private var heroes: [Heroes] = []
    
    private func loadAllContent() {
        heroes = datamanager.loadAllHeroes()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
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
        return heroes.count
      }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("SELECCIONAMOS \(indexPath.row)")
        onCompletion?(true, heroes[indexPath.row])
        dismiss(animated: true, completion: nil)
    }
    
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "heroesCell", for: indexPath) as! HeroesTableViewCell
        cell.contentView.backgroundColor = UIColor(hexString: cellColors[indexPath.row % cellColors.count])
          
        if indexPath.row < heroes.count {
            cell.nameLabel.text = heroes[indexPath.row].name
            cell.heroImage.image = UIImage(named: "\(heroes[indexPath.row].image ?? "")")
            switch heroes[indexPath.row].power {
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
