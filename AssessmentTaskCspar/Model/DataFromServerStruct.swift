//
//  DataFromServerStruct.swift
//  AssessmentTaskCspar
//
//  Created by Mallikarjuna on 16/12/20.
//  Copyright © 2020 Mallikarjuna. All rights reserved.
//

import Foundation
struct DataStruct:Codable {
    var Success:[SuccessStruct]?
    var location:[LocationStruct]?
}
struct SuccessStruct:Codable {
    var id:String?
    var name:String?
    var category:String?
    var categoryid:String?
    var address:String?
    var description:String?
    var contact:String?
    var empcode:String?
    var image:String?
}

struct LocationStruct:Codable {
    var lat:String?
    var longg:String?
}
