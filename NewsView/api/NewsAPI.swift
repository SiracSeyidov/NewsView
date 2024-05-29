//
//  NewsAPI.swift
//  NewsView
//
//  Created by Sirac Seyidov on 27.10.2023.
//

import Foundation
import SwiftUI

class NewsAPI : ObservableObject{
    @Published var list : [NewsModel] = []
    
    //This function gets data from internal JSON file (newsapi.json)
    func get(){
        guard let url = Bundle.main.url(forResource: "newsapi", withExtension: "json") else{
            print("json file not found")
            return
        }
        
        print("(news) making api call...")
        
        let data = try? Data(contentsOf: url)
        let news = try? JSONDecoder().decode([NewsModel].self, from: data!)
        self.list = news!
    }
    
    //This function gets data from your api url
    func getFromRealAPI(){
           guard let url = URL(string: "your_api_url") else{
               return
           }
           
           print("making api call...")
           
           var request = URLRequest(url: url)
           request.httpMethod = "GET"
           request.setValue("application/json", forHTTPHeaderField: "Content-Type")
           
           let session = URLSession.shared
           
           let task = session.dataTask(with: request) { data, response, error in
               if error != nil{
                   print("Error1: "+error!.localizedDescription)
               }else{
                   if data != nil{
                       do{
                           let obj = try JSONDecoder().decode([NewsModel].self, from: data!)
                           
                           DispatchQueue.main.async {
                               self.list = obj
                           }
                       }catch{
                           print("Error2: \(error)")
                       }
                   }
               }
           }
           task.resume()
       }
}
