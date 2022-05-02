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

        var i:Int32 = 0
        i = i+1
        print("program starts \(i)")
        #if false
            let url = URL(string: "https://opendata.epa.gov.tw/ws/Data/AQI/?$format=json")
            let data = try! Data(contentsOf: url!)
            let aqi = try! JSONDecoder().decode([AQI].self, from: data)
        #else

            let url = URL(string: "http://localhost/read_purchase_json2.php")
            //llee20220421 I will get an error if using let url = URL(string: "http://localhost/read_purchase_json2.php")
            
            let data = try! Data(contentsOf: url!)
        
            print("---0--\n")
            print(data)
        
            let html = String(data: data, encoding: .utf8)
            print("---1--\n")
            print(html)
            print("---1.1--\n")
            print(html!)
            
            print("---1.2--\n")
            print(data as NSData)
        
            //let aqi = try! JSONDecoder().decode([purchase].self, from: data)
        do {
                 let aqi = try JSONDecoder().decode([purchase].self, from: data)
                 print("---2--\n")
                 print(aqi)

                 print("---3--\n")
                 aqi.forEach { (p) in
                    print(p)
                 }

           } catch  {
                 print(" enter error routine \n")
                 print(error)
                 print(data)
        }
        
        
         //   print("---2--\n")
         //   print(aqi)
                
         //   print("---3--\n")
         //   aqi.forEach { (p) in
         //       print(p)
         //   }
        #endif

    }
}

