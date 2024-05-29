//
//  NewsDetailsView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 28.10.2023.
//

import SwiftUI
import SwiftData

struct NewsDetailsView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) private var dismiss
    let news: NewsModel
    @Query var list: [SwiftDataModel]
    @State private var fav: Bool = false
    @State private var crud: SwiftDataCRUD? = nil
    
    var body: some View {
        ZStack(alignment: .top){
            VStack{
                AsyncImage(url: URL(string: news.image)){ img in
                    img
                        .image?.resizable()
                        .aspectRatio(contentMode: .fill)
                }
                .frame(width: Dimens().w, height: Dimens().w*0.8)
            }
            
            VStack{
                Spacer().frame(height: Dimens().w*0.8-50)
                ScrollView(.vertical){
                    VStack(alignment: .leading){
                        Spacer().frame(height: 20)
                        Text(news.title)
                            .foregroundColor(.white)
                            .font(.system(size: 24))
                            .fontWeight(.bold)
                        Spacer().frame(height: 15)
                        HStack{
                            Text(news.author)
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                            Text("•")
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                            Text(news.date)
                                .foregroundColor(.gray)
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                        }
                        Spacer().frame(height: 20)
                        Text(news.description+news.description+news.description+news.description)
                            .foregroundColor(.white)
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                    }
                    .padding(.horizontal, 10)
                    .background(Colors().bg)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                
                HStack(alignment: .center){
                    Spacer().frame(width: 40)
                    Button(action: {
                        dismiss()
                    }){
                        Image(systemName: "chevron.left")
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    Button(action: {
                        if !fav{
                            crud?.create(id: news.id)
                        }else{
                            crud?.delete(id: news.id, list: list)
                        }
                        fav.toggle()
                    }){
                        if !fav{
                            Image(systemName: "bookmark")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }else{
                            Image(systemName: "bookmark.fill")
                                .fontWeight(.semibold)
                                .foregroundColor(.green)
                        }
                    }
                    .padding(.vertical, 15)
                    
                    Spacer().frame(width: 20)
                    
                    Button(action: {
                        
                    }){
                        Image(systemName: "square.and.arrow.up")
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    Spacer().frame(width: 40)
                }
                .background(Colors().bg2)
            }
        }
        .onAppear{
            crud = SwiftDataCRUD(modelContext: modelContext)
            
            fav = crud!.read(id: news.id, list: list)
            print("Fav: \(list.count) \(fav)")
        }
        .navigationBarBackButtonHidden(true)
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        .background(Colors().bg)
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    NewsDetailsView(news: NewsModel(id: 1, author: "John Doe", title: "James Webb Space Telescope Captures Stunning Images of the Carina Nebula", description: "The James Webb Space Telescope has captured stunning new images of the Carina Nebula, one of the largest and brightest nebulae in the sky. The images reveal previously unseen details of the nebula's towering pillars of gas and dust, as well as the stars that are forming within it.", date: "2023-10-26", url: "https://www.nasa.gov/image-feature/webb-captures-stunning-images-of-carina-nebula", image: "https://d3i6fh83elv35t.cloudfront.net/static/2022/07/spacealternative-1024x593.jpg"))
        .preferredColorScheme(.dark)
}
