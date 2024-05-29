//
//  ContentView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 26.10.2023.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var list: [SwiftDataModel]
    @State var selection = 1
    
    var body: some View {
        NavigationStack{
            CustomTabView()
        }
    }
}

#Preview {
    ContentView()
}
