//
//  ContentView.swift
//  InstagramHomeScreen
//
//  Created by Graham Furey on 8/17/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(.black).ignoresSafeArea()

                VStack(spacing: 5) {
                ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        
                        VStack(spacing: 5) {
                        
                        ZStack {
                            Image(systemName: "person.crop.circle")
                               .resizable()
                               .scaledToFit()
                               .frame(width: 45)
                               .foregroundColor(.white)
                            
                            ZStack {
                                Circle()
                                    .fill(Color(.systemBlue))
                                    .frame(width: 20)
                                
                                Image(systemName: "plus")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 10)
                                    .foregroundColor(.white)
                            }.offset(x: 12, y: 12)
                        }
                            
                         
                            Text("Your Story")
                                .font(.caption)
                                .foregroundColor(.gray)
                                
                            
                        }.frame(height: 70).padding(.leading, 10)
                        
                    ForEach(1..<10) { i in
                        StoryView(username: "profile\(i)").padding(.trailing, 10)
                        }
                    }.frame(height: 100)
                }
                
                PostView(username: "joerogan", text: "Greetings", imageName: "roganpic", numLikes: 14673, numComments: 9987, commenter: "druski", comment: "Wow")
                    
                }
            
                }.ignoresSafeArea().padding(.top, 30)
            
            VStack {
                HeaderView()
                
                Divider()
                
            }.offset(y: -370)
            
            
            VStack {
                
                Divider()
                BottomMenu()
                
            }.offset(y: 380)
        }
    }
}

struct HeaderView: View {
    @State var plus = false
    @State var heart = false
    @State var message = false
    
    var body: some View {
        HStack {
            
            Image("Logo")
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .colorInvert()
                .padding(.leading)
            
            Spacer(minLength: 0)
            
            Button(action: {plus.toggle()}) {
                
                Image(systemName: plus ? "plus.app.fill" : "plus.app")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.white)
                .padding(.leading, 5)
                
            }
            
            Button(action: {heart.toggle()}) {
            
                Image(systemName: heart ? "heart.fill" : "heart")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.white)
                .padding(.horizontal, 10)
            }
            
            Button(action: {message.toggle()}) {
            
                Image(systemName: message ? "message.circle.fill" : "message.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.white)
                .padding(.trailing, 10)
                
            }
            
        }
    }
}
    
struct BottomMenu : View {
    var icons = ["house", "magnifyingglass", "play.rectangle", "bag", ]
    
    var body: some View {
        HStack(spacing: 55) {
        ForEach(icons, id: \.self) { icon in
            
            BottomMenuIcon(iconName: icon)
        }
            Image(systemName: "person.crop.circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundColor(.white)
            
        }
    }
}
    
struct BottomMenuIcon : View {
    @State var icon : Bool = false
    var iconName: String
    
    var body: some View {
        
        Button(action: {icon.toggle()}) {
            Image(systemName: icon ? "\(iconName).fill" : iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                    .foregroundColor(.white)
            
        }
    }
}

struct StoryView : View {
    var username: String
    
    var body: some View {
        VStack(spacing: 5) {
        
        ZStack {
            
            Circle()
                .fill(LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: /*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/, endPoint: /*@START_MENU_TOKEN@*/.trailing/*@END_MENU_TOKEN@*/))
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(90))
            
            Circle()
                .fill(Color(.black))
                .frame(width: 45, height: 45)
            
             Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(.white)
        }
            
            Text(username)
                .font(.caption)
                .foregroundColor(.white)
            
        }
    }
}

struct PostView: View {
    var username: String
    var text: String
    var imageName: String
    
    var numLikes: Int
    var numComments: Int
    
    var commenter: String
    var comment: String
    
    @State var like = false
    @State var bookmark = false
    
    var body: some View {
        VStack() {
            
            HStack {
            StoryView(username: "")
                
                VStack(alignment: .center) {
            
                Text(username)
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.bottom)
                    
                }
                
                Spacer()
                
                VStack(alignment: .center) {
                Text("...")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
                    
                }
                
            }.padding(.horizontal)
            
            Image(imageName)
                .resizable()
                .frame(width: 400, height: 400)
                .clipped()
                .foregroundColor(.white)
            
            HStack {
                
                Button(action: {like.toggle()}) {
                    Image(systemName: like ? "heart.fill" : "heart")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                    .foregroundColor(like ? Color.red : Color.white)
                }
                
                Image(systemName: "message")
                .resizable()
                .scaledToFit()
                .frame(width: 25)
                .foregroundColor(.white)
                
                Image(systemName: "paperplane")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25)
                .foregroundColor(.white)
                
                Spacer(minLength: 0)
                
                
                Button(action: {bookmark.toggle()}) {
                    Image(systemName: bookmark ? "bookmark.fill" : "bookmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                .foregroundColor(.white)
                }
            }.padding(.horizontal)
            
            VStack(spacing: 3) {
            
            HStack {
            Text("\(numLikes) Likes")
                .font(.caption)
                .foregroundColor(.white)
                .fontWeight(.bold)
            
                Spacer()
                
            }.padding(.horizontal)
            
            HStack {
                Text(username)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing, -5)
                
                Text(text)
                    .font(.caption)
                    .foregroundColor(.white)
                
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("View all \(numComments) comments")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text(commenter)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.trailing, -5)
                
                Text(comment)
                    .font(.caption)
                    .foregroundColor(.white)
                
                Spacer()
            }.padding(.horizontal)
            
            HStack {
                Text("Aug 17")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                Spacer()
            }.padding(.horizontal)
                
            }
        }.padding(.bottom)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
