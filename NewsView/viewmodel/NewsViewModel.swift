//
//  NewsViewModel.swift
//  NewsView
//
//  Created by Sirac Seyidov on 26.10.2023.
//

import SwiftUI

struct NewsViewModel: View {
    @State private var goDetails: Bool = false
    let news: NewsModel
    
    var body: some View {
        VStack(alignment: .leading){
            NavigationLink(destination: NewsDetailsView(news: news), isActive: $goDetails){
            }
            
            Button(action: {
                goDetails = true
            }){
                VStack(alignment: .leading){
                    AsyncImage(url: URL(string: news.image))
                        .frame(width: Dimens().h*0.30, height: Dimens().h*0.30)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(1)
                    
                    Text(news.title)
                        .frame(width: Dimens().h*0.30, alignment: .leading)
                        .lineLimit(1)
                        .foregroundColor(.white)
                        .font(.system(size: 18))
                        .fontWeight(.semibold)
                        .padding(5)
                    
                    Text(news.author)
                        .frame(width: Dimens().h*0.30, alignment: .leading)
                        .lineLimit(1)
                        .foregroundColor(.gray)
                        .font(.system(size: 16))
                        .fontWeight(.regular)
                        .padding(.leading, 5)
                }
            }
        }
    }
}

#Preview {
    NewsViewModel(news: NewsModel(id: 1, author: "John Doe", title: "James Webb Space Telescope Captures Stunning Images of the Carina Nebula", description: "The James Webb Space Telescope has captured stunning new images of the Carina Nebula, one of the largest and brightest nebulae in the sky. The images reveal previously unseen details of the nebula's towering pillars of gas and dust, as well as the stars that are forming within it.", date: "2023-10-26", url: "https://www.nasa.gov/image-feature/webb-captures-stunning-images-of-carina-nebula", image: "https://d3i6fh83elv35t.cloudfront.net/static/2022/07/spacealternative-1024x593.jpg"))
        .preferredColorScheme(.dark)
}
