//
//  ContentView.swift
//  CustomImagePicker
//
//  Created by Brandon Santeliz on 28/12/23.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @State private var profileImage: Image = Image(systemName: "cloud")
    @State private var simpleImage: Image = Image(systemName: "cloud")
    @State private var withButtonImage: Image = Image(systemName: "cloud")
    
    var body: some View {
        
        CustomImagePicker(image: $profileImage, pickerStyle: .profile)
            .frame(width: 200, height: 200)
        
        CustomImagePicker(image: $simpleImage, pickerStyle: .simplePicker)
            .frame(width: 350, height: 200)
        
        CustomImagePicker(image: $withButtonImage, pickerStyle: .withButton)
            .frame(width: 350, height: 200)
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
