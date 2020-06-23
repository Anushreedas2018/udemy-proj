//
//  SwipeTableViewController.swift
//  Todoey
//
//  Created by Anushree Das on 12/06/20.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit
import SwipeCellKit

class SwipeTableViewController: UITableViewController, SwipeTableViewCellDelegate{

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 80.0

   
    }
    
//    Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SwipeTableViewCell
                
                
                cell.delegate = self
                
                return cell
    }

        func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
            guard orientation == .right else { return nil }

            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                
                self.updateModel(at: indexPath)
                // handle action by updating model with deletion
//                if let categoryForDeletion = self.categories?[indexPath.row]{
//                    do{
//                        try self.realm.write{
//                            self.realm.delete(categoryForDeletion)
//                        }
//
//                    }catch{
//                            print("Error deleting category \(error)")
//                    }
//    //                tableView.reloadData()
//                }
//                print("Delete cell")
            }

            // customize the action appearance
            deleteAction.image = UIImage(named: "deleteIcon")

            return [deleteAction]
        }
        func tableView(_ tableView: UITableView, editActionsOptionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> SwipeOptions {
            var options = SwipeOptions()
            options.expansionStyle = .destructive
            
    //        options.transitionStyle = .border
            return options
        }
    
    func updateModel(at indexPath: IndexPath){
        print("Item deleted from superclass")
        
    }
        
    
}




