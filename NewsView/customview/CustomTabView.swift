//
//  CustomTabView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 28.10.2023.
//

import Foundation
import SwiftUI

struct CustomTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack {
            switch selectedTab {
            case 0:
                NewsView()
                    .navigationTitle("News")
            case 1:
                ExploreView()
                    .navigationTitle("Explore")
            case 2:
                FavoritesView()
                    .navigationTitle("Bookmarks")
            default:
                Text("Unknown Tab Content")
            }
            
            Spacer()
            
            HStack(alignment: .center){
                Spacer()
                TabItem(title: "Home", image: "house", tag: 0)
                Spacer()
                TabItem(title: "Explore", image: "magnifyingglass", tag: 1)
                Spacer()
                TabItem(title: "Bookmark", image: "bookmark", tag: 2)
                Spacer()
            }
            .frame(width: Dimens().w, height: 50)
            .background(Colors().bg)
        }
        .background(Colors().bg)
        //.frame(width: Dimens().w, height: Dimens().h)
    }
    
    @ViewBuilder
    private func TabItem(title: String, image: String, tag: Int) -> some View {
        Button(action: {
            selectedTab = tag
        }) {
            HStack {
                Image(systemName: image)
                if selectedTab == tag{
                    Text(title)
                        .font(.system(size: 12))
                }
            }
            .frame(width: Dimens().w/4.5)
            .padding(.vertical, 10)
            .padding(.horizontal, 10)
            .foregroundColor(selectedTab == tag ? Colors().bg : .green)
            .background(selectedTab == tag ? .green : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView()
    }
}
