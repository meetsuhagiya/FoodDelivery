//
//  SingInView.swift
//  FoodDelivery
//
//  Created by student on 08/01/25.
//

import SwiftUI
import CountryPicker

struct SingInView: View {
    var body: some View {
        ZStack{
            Image("sign_in_top")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    SingInView()
}
