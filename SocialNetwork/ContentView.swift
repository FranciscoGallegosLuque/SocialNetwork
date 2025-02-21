//
//  ContentView.swift
//  SocialNetwork
//
//  Created by Francisco Manuel Gallegos Luque on 19/02/2025.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query var users: [User]
    
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
                for user in decodedResponse {
                    modelContext.insert(user)
                }
            }
        } catch {
            print("Invalid code")
        }
    }
    
}

#Preview {
    ContentView()
}
