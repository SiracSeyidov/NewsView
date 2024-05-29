//
//  NewsModel.swift
//  NewsView
//
//  Created by Sirac Seyidov on 26.10.2023.
//

import Foundation

struct NewsModel: Codable, Hashable{
    var title: String
    var description: String
    var date: String
    var url: String
    var image: String
}
