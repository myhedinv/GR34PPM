//
//  ViewController.swift
//  GR34PPM
//
//  Created by user252234 on 2/20/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Call function to fetch and display users
        fetchAndDisplayUsers()
    }
    
    func fetchAndDisplayUsers() {
        // Fetch users from the database using DBCommands
        if let users = DBCommands.presentRows() {
            // Display users in the console
            print("All users:")
            for user in users {
                print("ID: \(user.id), Name: \(user.name), Email: \(user.email), Balance: \(user.balance)")
            }
            // You can update the UI to display users here
        } else {
            print("No users found")
        }
    }
}


