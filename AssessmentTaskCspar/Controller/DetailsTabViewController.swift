//
//  DetailsTabViewController.swift
//  AssessmentTaskCspar
//
//  Created by Mallikarjuna on 17/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit

class DetailsTabViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
@IBOutlet weak var UserDetailsTableView: UITableView!
    var successDetails:[SuccessStruct]!
    
    override func viewDidLoad() {
        getTableviewDetails()
        DataManager.shared.getSuccessDetails { (datagetting) in
            if datagetting != nil{
                print("getSuccessDetails::::")
                self.successDetails = datagetting
                
            }
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

        func getTableviewDetails(){
            UserDetailsTableView.delegate = self
            UserDetailsTableView.dataSource = self
    
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return successDetails.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            var cell = tableView.dequeueReusableCell(withIdentifier: "abc", for: indexPath)
            cell.textLabel!.text = successDetails[indexPath.row].name!

            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var perVC = (storyboard?.instantiateViewController(identifier: "PVC"))! as UserDetailsViewController
        
        
        
        perVC.perticularSuccessDetails = successDetails[indexPath.row]
        present(perVC, animated: true)
        
    }

}
