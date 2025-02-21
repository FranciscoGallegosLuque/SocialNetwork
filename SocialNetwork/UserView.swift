//
//  UserView.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 20/02/2025.
//

import SwiftData
import SwiftUI

struct UserView: View {
    var user: User
    
    var body: some View {
        
        List {
            Section("Basic info") {
                Text("\(Text("Name:").bold()) \(user.name)")
                Text("\(Text("Email:").bold()) \(user.email)")
                Text("\(Text("Address:").bold()) \(user.address)")
                Text("\(Text("Company:").bold()) \(user.company)")
                Text("\(Text("About:").bold()) \(user.about)")
                
            }
            Section ("Friends"){
                ForEach(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        
    }
}

//    #Preview{
//        let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        UserView(user: User(from: data))
//    }
