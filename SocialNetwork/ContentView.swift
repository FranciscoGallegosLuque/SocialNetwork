//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 19/02/2025.
//

import SwiftUI

struct User: Codable, Identifiable, Hashable {
    
    struct Friend: Codable, Identifiable, Hashable {
        let id: UUID
        let name: String
    }
    
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
}



struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List (users) { user in
                NavigationLink (value: user){
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundStyle(user.isActive ? .green : .red)
                    }
                }
            }
            .task {
                await loadData()
            }
            .navigationTitle("Users")
            .navigationDestination(for: User.self)  { user in
                UserView(user: user)
            }
        }
    }
    
    func loadData() async {
        if !users.isEmpty {
            return
        }
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let decodedResponse = try? decoder.decode([User].self, from: data) {
                users = decodedResponse
            }
        } catch {
            print("Invalid code")
        }
    }
    
}

#Preview {
    ContentView()
}
