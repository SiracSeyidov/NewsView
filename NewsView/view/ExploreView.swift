//
//  ExploreView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 27.10.2023.
//

import SwiftUI

struct ExploreView: View {
    @StateObject var api = NewsAPI()
    @State private var searchText = ""
    @State private var newsList: [NewsModel] = []
    
    var body: some View {
        VStack{
            ScrollView(.vertical){
                VStack(spacing: 25){
                    ForEach(filter(), id: \.self){ n in
                        ExploreViewModel(news: n)
                    }
                }
            }
        }
        .searchable(text: $searchText, prompt: "Search")
        .onAppear{
            api.get()
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Colors().bg)
    }
    
    private func filter() -> [NewsModel]{
        guard !searchText.isEmpty else { return api.list }
        return api.list.filter{
            $0.title.localizedCaseInsensitiveContains(searchText)
        }
    }
}

#Preview {
    ExploreView()
}
