//
//  CustomImagePicker.swift
//  CustomImagePicker
//
//  Created by Brandon Santeliz on 28/12/23.
//

import SwiftUI

// MARK: - Custom Image Picker for iOS14+

struct CustomImagePicker: View {
    
    // MARK: - Properties
    
    enum ImagePickerStyle {
        case profile, simplePicker, withButton
    }
    
    @State private var hideInitialView: Bool = false
    @State private var showAlbum: Bool = false
    @Binding private var image: Image
    
    private let pickerStyle: ImagePickerStyle
    
    // MARK: - Initializer
    
    init(image: Binding<Image>,
         pickerStyle: ImagePickerStyle = .profile) {
        _image = image
        self.pickerStyle = pickerStyle
    }
    
    // MARK: - Image Picker Configuration
    
    var body: some View {
        
        VStack {
            if pickerStyle == .withButton {
                withButtonPicker
            } else {
                Button {
                    showAlbum.toggle()
                } label: {
                    switch pickerStyle {
                        case .profile: profileImage
                        case .simplePicker: simplePicker
                        default: EmptyView()
                    }
                }
                .shadow(color: .gray.opacity(0.5), radius: 10)
                .buttonStyle(.plain)
                .sheet(isPresented: $showAlbum) {
                    ImagePicker(selectedImage: $image)
                }
            }
        }
        .onChange(of: image) { value in
            hideInitialView = true
        }
    }
    
    // MARK: - Placeholder Text
    
    private var placeHolderText: some View {
        Rectangle()
            .fill(.black.opacity(0.2))
            .overlay (
                Text(hideInitialView ? "Change image" : "Select an image")
                .bold()
                .padding()
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            )
    }
}

// MARK: - Image Picker Styles

extension CustomImagePicker {
    
    // MARK: - Profile Image Style
    
    @ViewBuilder
    private var profileImage: some View {
        let selectedImage = hideInitialView ?
        image : Image(systemName: "camera.circle.fill")
        
        selectedImage
            .resizable()
            .background (
                Circle()
                    .fill(Color.gray.opacity(0.5))
            )
            .scaledToFill()
            .overlay(placeHolderText)
            .clipShape(Circle())
    }
    
    // MARK: - Simple Image Style
    
    @ViewBuilder
    private var simplePicker: some View {
        if hideInitialView {
            image
                .resizable()
                .overlay(placeHolderText)
                .clipShape(RoundedRectangle(cornerRadius: 10))
        } else {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray)
                .overlay(placeHolderText)
        }
    }
    
    // MARK: - With Buttom Image Style
    
    @ViewBuilder
    private var withButtonPicker: some View {
        VStack {
            if hideInitialView {
                image
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.gray)
            }
        }
        .overlay (
            Button {
                showAlbum.toggle()
            } label: {
                Image(systemName: "photo.on.rectangle.angled")
                    .renderingMode(.template)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.5))
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .padding()
                    .sheet(isPresented: $showAlbum) {
                        ImagePicker(selectedImage: $image)
                    }
            },
            alignment: .topLeading
        )
    }
}
