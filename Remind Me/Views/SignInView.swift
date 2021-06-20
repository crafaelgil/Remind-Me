//
//  SignInView.swift
//  Remind Me
//
//  Created by Carlos Gil on 2021/06/19.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Thank you for using my application")
            SignInWithAppleButton()
                .frame(width: 280, height: 45)
                .onTapGesture {
                    self.presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
