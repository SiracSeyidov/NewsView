//
//  NewsView.swift
//  NewsView
//
//  Created by Sirac Seyidov on 27.10.2023.
//

import SwiftUI

struct NewsView: View {
    @StateObject var api = NewsAPI()
    
    var body: some View {
        VStack{
            ScrollView(.vertical){
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 15)
                        ForEach(api.list, id: \.self){ n in
                            NewsViewModel(news: n)
                        }
                    }
                }
                
                HStack{
                    Text("Just for you")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.bottom, 5)
                
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 15)
                        ForEach(api.list.shuffled(), id: \.self){ n in
                            NewsViewModel(news: n)
                        }
                    }
                }
                
                HStack{
                    Text("Most read")
                        .foregroundColor(.white)
                        .font(.system(size: 24))
                        .fontWeight(.semibold)
                        .padding(.leading, 10)
                    Spacer()
                }
                .padding(.top, 20)
                .padding(.bottom, 5)
                
                ScrollView(.horizontal){
                    HStack{
                        Spacer().frame(width: 15)
                        ForEach(api.list.reversed(), id: \.self){ n in
                            NewsViewModel(news: n)
                        }
                    }
                }
            }
        }
        .onAppear{
            api.get()
        }
        .background(Colors().bg)
        .frame(width: UIScreen.main.bounds.width)
    }
}

#Preview {
    NewsView()
}
