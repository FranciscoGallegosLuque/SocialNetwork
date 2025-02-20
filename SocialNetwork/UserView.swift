//
//  UserView.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 20/02/2025.
//

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

#Preview {
    UserView(user: User(id: UUID(uuidString: "50a48fa3-2c0f-4397-ac50-64da464f9954")!, isActive: true, name: "John Jones", age: 34, company: "Apple", email: "johnjones@gmail.com", address: "P Shermann 42", about: "Cool guy", registered: Date.now, tags: ["cool","nice"], friends: [User.Friend(id: UUID(uuidString: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed0")!, name: "Jack Black"), User.Friend(id: UUID(uuidString: "91b5be3d-9a19-4ac2-b2ce-89cc41884ed1")!, name: "John White")]))
}
