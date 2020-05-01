//
//  ThirdViewController.swift
//  AvengersApp
//
//  Created by Fran González on 19/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//
import UIKit

class VillainsTableViewController: UITableViewController {
    var cellColors = ["#F28044","#F0A761","#FEC362","#F0BB4C","#E3CB92","#FEA375"]
    let datamanager = DataManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 200
        configureTableView()
        
        loadAllContent()
        showData()
            // Uncomment the following line to preserve selection between presentations
            // self.clearsSelectionOnViewWillAppear = false

            // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
            // self.navigationItem.rightBarButtonItem = self.editButtonItem
        }
    
    // MARK: Private methods
    
    private var villains: [Villains] = []
    
    override func viewWillAppear(_ animated: Bool) {
        showData()
    }
    private func loadAllContent() {
        villains = datamanager.loadAllVillains()
        if villains.isEmpty {
            datamanager.loadInitialData()
            villains = datamanager.loadAllVillains()
        }
        
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

          override func prepare(for segue: UIStoryboardSegue, sender: Any?)
          {
               if (segue.identifier == "SEGUE_FROM_VILLAINS_TO_DETAIL") {
                  if let indexPath = self.tableView.indexPathForSelectedRow {
                      guard let destinationVC = segue.destination as? VillainsDetailViewController else { return }
                      destinationVC.barTitle = villains[indexPath.row].name
                    destinationVC.villain = villains[indexPath.row]
                    
                  }

              }
              
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

          /*
          // Override to support conditional editing of the table view.
          override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
              // Return false if you do not want the specified item to be editable.
              return true
          }
          */

          /*
          // Override to support editing the table view.
          override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
              if editingStyle == .delete {
                  // Delete the row from the data source
                  tableView.deleteRows(at: [indexPath], with: .fade)
              } else if editingStyle == .insert {
                  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
              }
          }
          */

          /*
          // Override to support rearranging the table view.
          override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

          }
          */

          /*
          // Override to support conditional rearranging of the table view.
          override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
              // Return false if you do not want the item to be re-orderable.
              return true
          }
          */

          /*
          // MARK: - Navigation

          // In a storyboard-based application, you will often want to do a little preparation before navigation
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
              // Get the new view controller using segue.destination.
              // Pass the selected object to the new view controller.
          }
          */

}
