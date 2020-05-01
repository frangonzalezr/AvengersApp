//
//  SecondViewController.swift
//  AvengersApp
//
//  Created by Fran González on 19/04/2020.
//  Copyright © 2020 FranGonzalezRamos. All rights reserved.
//

import UIKit

class BattlesTableViewController: UITableViewController {
    var cellColors = ["#F28044","#F0A761","#FEC362","#F0BB4C","#E3CB92","#FEA375"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 100

        }
        // MARK: - Table view data source

          override func numberOfSections(in tableView: UITableView) -> Int {
              // #warning Incomplete implementation, return the number of sections
              return 6
          }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
          override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
              // #warning Incomplete implementation, return the number of rows
              return 1
          }
    
        override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
            headerView.backgroundColor = UIColor(hexString: "#F0A761")
            let label = UILabel(frame: CGRect(x: 0, y: 0, width:tableView.bounds.size.width, height: 45))
            label.textColor = UIColor.white
            label.textAlignment = .center
            label.text = "Batalla \(section + 1)"
            headerView.addSubview(label)
            return headerView
        }
          
    
          override func prepare(for segue: UIStoryboardSegue, sender: Any?)
          {
               if (segue.identifier == "SEGUE_FROM_BATTLES_TO_DETAIL") {
                  if let indexPath = self.tableView.indexPathForSelectedRow {
                      guard let destinationVC = segue.destination as? BattlesDetailViewController else { return }
                      destinationVC.barTitle = "\(indexPath)"
                  }

              }
              
          }
          
            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "battlesCell", for: indexPath)
              cell.contentView.backgroundColor = UIColor(hexString: cellColors[indexPath.row % cellColors.count])
                // Configure the cell...

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

