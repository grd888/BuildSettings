//
//  ContentView.swift
//  BuildSettings
//
//  Created by Greg Delgado on 8/26/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationStack {
                BuildInfoView()
            }
            .tabItem {
                Label("Build Info", systemImage: "ellipsis")
            }
        }
    }
}

#Preview {
    ContentView()
}
