//
//  DataManager.swift
//  AssessmentTaskCspar
//
//  Created by Mallikarjuna on 16/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    static var shared = DataManager()
    
    private override init() {
        
        super.init()
    }
    var URLReqObj:URLRequest!
    var dataTasking:URLSessionDataTask!
//    func fetchDataFromServer(url:String,completion:@escaping(DataStruct?,Error?) -> Void) {
    
    var convertedData:DataStruct?
    
    func fetchDataFromServer(completion:@escaping ([LocationStruct]?,Error?)->Void) {
    
            URLReqObj = URLRequest(url: URL(string: "https://aryu.co.in/tracking/viewreport.php")!)
            
            URLReqObj.httpMethod = "GET"
            dataTasking = URLSession.shared.dataTask(with: URLReqObj, completionHandler: { (dataObtained, connectionDetails, error) in
               
                DispatchQueue.main.async {
                    
                    
                         if let data = dataObtained{
                            do{
                                self.convertedData = try JSONDecoder().decode(DataStruct.self, from: data)
                            
//                        print(convertedData.Success!)
                                print("data has been converted")
                                completion(self.convertedData!.location,nil)
                        
                    }catch{
                        print("unable to convert")
                    }
                    }
                    
                    if error != nil{
                        print(error!.localizedDescription)
                        completion(nil,error)
                        
                    }
                        
                }
                
            })
            dataTasking.resume()
            
            
        }
    
    
    func getSuccessDetails(completion:@escaping([SuccessStruct]?)->Void){
        
        if let successData = convertedData!.Success{
            completion(successData)
        }
        
            
    }
    

}
