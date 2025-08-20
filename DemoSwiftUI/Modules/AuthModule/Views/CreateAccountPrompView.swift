//
//  CreateAccountPrompView.swift
//  DemoSwiftUI
//
//  Created by Hitesh.Chouhan on 18/07/25.
//

import SwiftUI

struct CreateAccountPrompView: View {
    var body: some View {
        HStack {
            Text("Don't have an account?")
                .foregroundStyle(.black)
                .fontWeight(.medium)
            Text("Register Now")
                .foregroundStyle(.green)
                .fontWeight(.medium)
                .onTapGesture {
                    //
                }
        }
    }
}

#Preview {
    CreateAccountPrompView()
}
