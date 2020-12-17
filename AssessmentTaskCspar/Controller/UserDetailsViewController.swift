//
//  UserDetailsViewController.swift
//  AssessmentTaskCspar
//
//  Created by Mallikarjuna on 16/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    var urlDtaTAsk:URLSessionDataTask!
    @IBOutlet weak var userProfileView: UIImageView!
    
    @IBOutlet weak var userIdLbl: UILabel!
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var categoryLbl: UILabel!
    
    @IBOutlet weak var categoryidLbl: UILabel!
    
    @IBOutlet weak var addressLbl: UILabel!
    
    @IBOutlet weak var descriptionLbl: UILabel!
    
    @IBOutlet weak var contactLbl: UILabel!
    
    @IBOutlet weak var empcodeLbl: UILabel!
//    var imageObj:UIImageView!
    var perticularSuccessDetails:SuccessStruct!
    
    override func viewDidLoad() {
//        nameLbl.text = perticularSuccessDetails.name
//        getdetails()
        
        self.userProfileView.layer.cornerRadius = self.userProfileView.frame.size.width/2
        self.userProfileView.clipsToBounds = true
        self.userProfileView.layer.borderWidth = 3
        
        super.viewDidLoad()

        getdetails()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getdetails() {
        nameLbl.text = "name: \(perticularSuccessDetails.name!)"
        categoryLbl.text = "category: \(perticularSuccessDetails.category!)"
        userIdLbl.text = "id: \(perticularSuccessDetails.id!)"
        categoryidLbl.text = "categoryid: \(perticularSuccessDetails.categoryid!)"
        addressLbl.text = "address: \(perticularSuccessDetails.address!)"
        descriptionLbl.text = "description: \(perticularSuccessDetails.description!)"
        contactLbl.text = "contact: \(perticularSuccessDetails.contact!)"
        empcodeLbl.text = "empcode: \(perticularSuccessDetails.empcode!)"

        
        urlDtaTAsk = URLSession.shared.dataTask(with: URL(string: perticularSuccessDetails.image!)!) { (data, connectiondetails, error) in
            print(self.perticularSuccessDetails.image!)
            DispatchQueue.main.async {

                if let imageData = data{

                    self.userProfileView.image = UIImage(data: imageData)
                    self.userProfileView.contentMode = .scaleAspectFit

                }
            }
        }
        urlDtaTAsk.resume()

        
    }
}

