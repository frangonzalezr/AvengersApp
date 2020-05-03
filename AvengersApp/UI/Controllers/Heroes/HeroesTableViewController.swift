//
//  FirstViewController.swift
//  AvengersApp
//
//  Created by Fran González on 19/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class HeroesTableViewController: UITableViewController {
    var cellColors = ["#264f96","#6893d9","#367beb","#6893d9","#97b1db","#a3bce6"]
    
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
        if heroes.isEmpty {
            datamanager.loadInitialData()
            heroes = datamanager.loadAllHeroes()
        }
        
     }
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
    }
    
    private func showData() {
        tableView.reloadData()
    }
    // MARK: - Table view data source

    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
    }
    
      override func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
      }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         if (segue.identifier == "SEGUE_FROM_HEROES_TO_DETAIL") {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                guard let destinationVC = segue.destination as? HeroesDetailViewController else { return }
                destinationVC.barTitle = heroes[indexPath.row].name
                destinationVC.hero = heroes[indexPath.row]
                
            }

        }
        
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

