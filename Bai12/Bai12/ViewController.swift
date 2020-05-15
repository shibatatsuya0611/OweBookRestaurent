//
//  ViewController.swift
//  Bai12
//
//  Created by Xuan Huy on 11/6/19.
//  Copyright © 2019 Xuan Huy. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Characters.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterViewCell") as! CharacterTableViewCell
        let char:Character = Characters[indexPath.row]
        if (char.image != nil)
        {
            cell.imageViewChar?.image = char.image
        }
        else
        {
            cell.imageViewChar?.image = UIImage(named: char.imageName!)
        }
        
        cell.lblCharName?.text = char.CharacterName
        cell.lblrating?.text = ""
        for _ in 1...(char.rating ?? 1)
        {
            cell.lblrating?.text = (cell.lblrating?.text ?? "") + "⭐️"
        }
        cell.lbldescription?.text = char.description
        return cell
    }
    // Delete + update a cell
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        let chars = Characters[indexPath.row]
        let editAtion = UITableViewRowAction(style: .default, title: "Edit") {(action, indexPath) in
            // Call update action
            self.updateAtion(char: chars, indexPath: indexPath)
        }
        let deletaAction = UITableViewRowAction(style: .default, title: "Delete") {(action, indexPath) in
            // Call delete action
            self.deleteAction(char: chars, indexPath: indexPath)
        }
        deletaAction.backgroundColor = .red
        editAtion.backgroundColor = .cyan
        return [deletaAction, editAtion]
    }
    
    private func updateAtion(char: Character, indexPath: IndexPath)
    {
        let alert = UIAlertController(title: "Update", message: "Update Character", preferredStyle: .alert)
        let saveAtion = UIAlertAction(title: "Save", style: .default) { (action) in
            guard let textField = alert.textFields?.first else
            {
                return
            }
            if let textToEdit = textField.text
            {
                if textToEdit.count == 0
                {
                    return
                }
                char.CharacterName = textToEdit
                self.tableView?.reloadRows(at: [indexPath], with: .automatic)
                print("Da Save !")
            }
            else
            {
                return
                
            }
        }
        let cancelAtion = UIAlertAction(title: "Cancel", style: .default)
        alert.addTextField()
        guard let textField = alert.textFields?.first
        else
        {
            
            return
            
        }
        textField.placeholder = "Thay doi character name cua ban !"
        alert.addAction(saveAtion)
        alert.addAction(cancelAtion)
        present(alert, animated: true)
    }
    private func deleteAction(char: Character, indexPath: IndexPath)
    {
        let alert = UIAlertController(title: "Delete", message: "Chac chu ?", preferredStyle: .alert)
        
        let deleteAction = UIAlertAction(title: "Yes", style: .default){(action) in
            Characters.remove(at: indexPath.row)
            self.tableView?.deleteRows(at: [indexPath], with: .automatic)
            print("Da xoa !")
        }
        let cancelAction = UIAlertAction(title: "No", style: .default, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

