//
//  SignInView.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/19.
//

import SwiftUI

struct SignInView: View {
    var body: some View {
        VStack {
            Text("Thank you for using my application")
            SignInWithAppleButton()
                .frame(width: 280, height: 45)
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
