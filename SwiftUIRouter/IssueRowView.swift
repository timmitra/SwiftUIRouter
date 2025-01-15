//
//  IssueRowView.swift
//  SwiftUIRouter
//
//  Created by Tim Mitra on 2025-01-15.
//

import SwiftUI

struct IssueRowView: View {
    let issue: Issue

    var body: some View {
        VStack(alignment: .leading) {
            Text(issue.title)
                .font(.headline)
            Text("Issue #\(issue.number)")
                .font(.caption)
                .foregroundStyle(.secondary)
        }
    }
}

//#Preview {
//    IssueRowView(issue: <#Issue#>)
//}
