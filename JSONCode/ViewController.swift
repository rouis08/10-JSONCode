//
//  ViewController.swift
//  JSONCode
//
//  Created by KoKang Chu on 2019/8/14.
//  Copyright © 2019 KoKang Chu. All rights reserved.
//

import UIKit



#if false
struct AQI: Codable {
//    enum CodingKeys : String, CodingKey {
//        case county = "County"
//        case sitename = "SiteName"
//        case aqi = "AQI"
//    }
    
    var County: String
    //var SiteName: String
    //var AQI: String
}

#else
struct purchase: Codable {
//    enum CodingKeys : String, CodingKey {
//        case county = "County"
//        case sitename = "SiteName"
//        case aqi = "AQI"
//    }
    
    var id: String
    var item: String
    var price: String
    var amount: String
    var shipping: String
    var total: String
    var purchase_date: String
    var location: String
    var payment: String
    var note: String
    

}
#endif



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        #if false
        let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
        #else
        // This is to receive my created page.
        let url = URL(string: "http://localhost/read_purchase_json2.php")
        #endif
        let data = try! Data(contentsOf: url!)

        let aqi = try! JSONDecoder().decode([purchase].self, from: data)

        aqi.forEach { (p) in
            print(p)
        }
    }
}

