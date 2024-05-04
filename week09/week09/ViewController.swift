//
//  ViewController.swift
//  week09
//
//  Created by juhee on 2022/11/26.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var searchField: UITextField!
    
    let session = URLSession(configuration: .default)
    var urlComponents = URLComponents(string: "http://apis.data.go.kr/1613000/SubwayInfoService/getKwrdFndSubwaySttnList")!
    let subwayStaionName = URLQueryItem(name: "subwayStationName", value: "강남")
    let serviceKeyString = "mt8QvzRlySgOZzPrNC%2Bk9Zkk5ptSUamzyJ9m2CxI2IEjEmTYEXeg5XZOnejtnJ4XPZ4Hd6aFCiSjI%2BrC0DQQHw%3D%3D".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    var serviceKey: URLQueryItem {
        .init(name: "serviceKey", value: serviceKeyString)
    }
    let type = URLQueryItem(name: "_type", value: "json")
//    $var dataList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        startNetworking()
    }
        
    func startNetworking() {
        let queryItems: [URLQueryItem] = [subwayStaionName, serviceKey, type]
        urlComponents.queryItems = queryItems
        
        let requestURL = urlComponents.url!
        let dataTask = session.dataTask(with: requestURL) { data, response, error in let successRange = 200..<300
            guard error == nil,
                    let statusCode = (response as? HTTPURLResponse)?.statusCode, successRange.contains(statusCode),
                    let resultData = data
            else { return }
            guard let dataModelResponse = try? JSONDecoder().decode(DataModel.self, from: resultData)
            else { self.startNetworking(); return }
            dataModelResponse.response.body.items.item.forEach {
                print($0)
            }
        }
        dataTask.resume()
    }

//    @IBAction func onSearchButtonClicked(_ sender: Any) {
//        let url = API.BASE_URL + "search/photos"
//        guard let userInput = self.searchField.text else { return }
//        let queryParam = ["client_id" : API.CLIENT_ID,
//                          "query" : userInput]
//
//        request(url, method: .get, parameters: queryParam).responseJSON(completionHandler: {
//            response in
//            debugPrint(response)
//        })
//    }
}

