//
//  HeroesDetailViewController.swift
//  AvengersApp
//
//  Created by Fran González on 20/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class HeroesDetailViewController: UITableViewController {
    


    var barTitle: String?
    var hero: Heroes?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = barTitle
        configureTableView()
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
        return 4
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection
                                section: Int) -> String? {
        switch section {
        case 1:
            return "SuperPoder"
        case 2:
            return "Batallas"
        case 3:
            return "Biografía"
        default:
            return ""
        }
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
         if (segue.identifier == "SEGUE_FROM_HERO_POWER_TO_EDITPOWER") {
                guard let destinationVC = segue.destination as? EditPowerViewController else { return }
                destinationVC.power = Double(hero!.power)
                destinationVC.hero = self.hero
                destinationVC.onCompletion = { success in
                    self.tableView.reloadData()
                }
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section {
        case 0:
            return 258
        case 1:
            return 46
        case 2:
            return 59
        case 3:
            return 200
        default:
            return UITableView.automaticDimension
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesImageCell") as! HeroesImageTableViewCell
            cell.backgroundColor = UIColor(hexString: "#6893d9")
            cell.heroImage.image = UIImage(named: "\(hero?.image ?? "")")
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeroesPowerCell") as! HeroesPowerTableViewCell
            cell.backgroundColor = UIColor(hexString: "#97b1db")
            switch hero?.power {
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
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BattleTableCell") as! HeroesBattlesTableViewCell
            cell.backgroundColor = UIColor(hexString: "#a3bce6")
            cell.heroId = hero?.id ?? 0
            return cell
        } else if indexPath.section == 3 {
            let cell = tableView.dequeueReusableCell(withIdentifier:"HeroesBioCell") as! HeroesBioTableViewCell
            cell.backgroundColor = UIColor(hexString: "#367beb")
            cell.biography.text = hero?.summary
            return cell
        } else {
            return UITableViewCell()
        }


        }
    }
    
    

