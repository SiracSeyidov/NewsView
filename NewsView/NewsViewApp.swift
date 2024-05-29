//
//  NewsViewApp.swift
//  NewsView
//
//  Created by Sirac Seyidov on 26.10.2023.
//

import SwiftUI
import SwiftData

@main
struct NewsViewApp: App {
    @AppStorage("darkMode") private var darkMode: Bool = true
    var body: some Scene {
        WindowGroup {
            ContentView()
                .colorScheme(.dark)
        }
        .modelContainer(for: SwiftDataModel.self)
    }
}
