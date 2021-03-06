//
//  BattlesTableViewController.swift
//  AvengersApp
//
//  Created by Fran González on 19/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class BattlesTableViewController: UITableViewController {
    var cellColors = ["#84FF95","#4AFF3F","#4FFF84","#71FEAC","#97FFBE","#B0FF91"]
    
    
    let datamanager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 100
        
        configureTableView()
        refreshContent()


        }
    
    // MARK: Private methods
    
    private var battles: [Battles] = []
    
    private func refreshContent() {
        loadAllContent()
        showData()
    }
    
    private func loadAllContent() {
        battles = datamanager.loadAllBattles()
     }
    
    override func viewWillAppear(_ animated: Bool) {
        refreshContent()
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
        return battles.count
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              return 1
          }
    
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
            headerView.backgroundColor = UIColor(hexString: cellColors[section % cellColors.count])
            let label = UILabel(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "Batalla \(section + 1)"
            headerView.addSubview(label)
            return headerView
        }
          
    
          override func prepare(for segue: UIStoryboardSegue, sender: Any?)
          {
               if segue.identifier == "SEGUE_FROM_BATTLES_TO_DETAIL" {
                      guard let destinationVC = segue.destination as? BattlesDetailViewController else { return }
                    let cell = sender as! BattlesTableViewCell
                    guard let indexPaths = self.tableView.indexPath(for: cell) else { return }
                        destinationVC.battles = battles
                        destinationVC.battlePos = indexPaths.section
                        destinationVC.onCompletion = { success in
                          self.refreshContent()
                      }
               } else if segue.identifier == "SEGUE_FROM_BATTLES_TO_ADD_BATTLE" {
                guard let destinationVC = segue.destination as? AddBattleViewController else { return }
                destinationVC.onCompletion = { success in
                    self.refreshContent()
                }
            }
          }
          
            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "battlesCell", for: indexPath) as! BattlesTableViewCell
              cell.contentView.backgroundColor = UIColor(hexString: cellColors[indexPath.section % cellColors.count])
                // Configure the cell...
                let battleHero = battles[indexPath.section].hero
                let battleVillain = battles[indexPath.section].villain
                let battleWinner = battles[indexPath.section].winner
                let allHeroes = datamanager.loadAllHeroes()
                let allVillains = datamanager.loadAllVillains()
                if battleWinner == battleHero {
                    cell.heroBar.backgroundColor = .blue
                    cell.villainBar.backgroundColor = .red
                } else {
                    cell.heroBar.backgroundColor = .red
                    cell.villainBar.backgroundColor = .blue
                }
                
                let cellHero = allHeroes.filter({ $0.id == battleHero })
                cell.heroBattleImage.image = UIImage(named: "\(cellHero[0].image ?? "")")
                
                let cellVillain = allVillains.filter({ $0.id == battleVillain })
                cell.villainBattleImage.image = UIImage(named: "\(cellVillain[0].image ?? "")")
                
                
                
                return cell
            }
          
    

          override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
              if editingStyle == .delete {
                self.datamanager.deleteBattle(self.battles[indexPath.section])
                self.battles.remove(at: indexPath.section)
                tableView.beginUpdates()
                tableView.deleteSections(IndexSet(integer: indexPath.section), with: .fade)
                tableView.deleteRows(at: [indexPath], with: .fade)
                tableView.endUpdates()
              }
          }
}

