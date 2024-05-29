//
//  SwiftDataModel.swift
//  NewsView
//
//  Created by Sirac Seyidov on 28.10.2023.
//

import Foundation
import UIKit
import SwiftUI
import SwiftData

@Model
class SwiftDataModel {
    var id: Int
    
    init(id: Int = 0) {
        self.id = id
    }
}
