//
//  SwiftDataCRUD.swift
//  NewsView
//
//  Created by Sirac Seyidov on 30.10.2023.
//

import Foundation
import SwiftUI
import SwiftData

class SwiftDataCRUD : ObservableObject{
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func create(id: Int){
        let news = SwiftDataModel(id: id)
        modelContext.insert(news)
    }
    
    func delete(id: Int, list: [SwiftDataModel]){
        let index = list.firstIndex(where: { $0.id == id })
        modelContext.delete(list[index!])
    }
    
    //completion: @escaping (Bool) -> ()
    func read(id: Int, list: [SwiftDataModel]) -> Bool{
        return list.contains(where: { $0.id == id })
    }
}
