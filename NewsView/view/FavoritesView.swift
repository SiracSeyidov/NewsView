//
//  FavoritesView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 27.10.2023.
//

import SwiftUI
import SwiftData

struct FavoritesView: View {
    @Query var news: [SwiftDataModel]
    @StateObject var api = NewsAPI()
    @State private var newsList: [NewsModel] = []
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack{
            List{
                ForEach(newsList, id: \.self){ n in
                    FavoritesViewModel(news: n)
                        .padding(.vertical, 25)
                }
                .onDelete(perform: { indexSet in
                    removeFav(indexSet)
                })
            }
        }
        .onAppear{
            newsList.removeAll()
            api.get()
            
            for newsItem in api.list {
                if news.contains(where: { $0.id == newsItem.id }) {
                    newsList.append(newsItem)
                    print(newsItem)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width)
        .background(Colors().bg)
    }
    
    func removeFav(_ indexSet: IndexSet){
        for index in indexSet{
            let n = news[index]
            modelContext.delete(n)
        }
    }
}

#Preview {
    FavoritesView()
        .preferredColorScheme(.dark)
}
