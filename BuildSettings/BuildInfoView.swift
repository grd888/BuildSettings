//
//  BuildInfoView.swift
//  BuildSettings
//
//  Created by Greg Delgado on 8/26/24.
//

import SwiftUI

struct BuildInfoView: View {
    var body: some View {
        List {
            VStack {
                Section {
                    infoRow(label: "Environment", value: GlobalSettings.environment.rawValue)
                    infoRow(label: "Base URL", value: GlobalSettings.baseApiPath, divider:  false)
                } header: {
                    headerView(title: "Build Config Variables")
                }
                
                Section {
                    infoRow(label: "Force Subscription State", value: "False", divider:  false)
                } header: {
                    headerView(title: "Environment Variables")
                }
                
                Section {
                    infoRow(label: "Log Level", value: GlobalSettings.logLevel, divider:  false)
                } header: {
                    headerView(title: "Hybrid Variables")
                }
            }

        }
        .navigationTitle("Build Info")
    }
}

#Preview {
    NavigationStack {
        BuildInfoView()
    }
}

extension BuildInfoView {
    private func headerView(title: String) -> some View {
        Text(title)
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical)
    }
    
    private func infoRow(label: String, value: String, divider: Bool = true) -> some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundStyle(Color.secondary)
            if divider {
                Divider()
            }
        }
        .padding(.bottom, 8)
    }
}
