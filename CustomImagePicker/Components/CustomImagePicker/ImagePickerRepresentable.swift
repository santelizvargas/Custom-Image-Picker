//
//  ImagePickerRepresentable.swift
//  CustomImagePicker
//
//  Created by Brandon Santeliz on 28/12/23.
//

import SwiftUI

struct ImagePicker {
    
    typealias CustomImagePicker = UIViewControllerRepresentableContext<ImagePicker>
    
    @Environment(\.presentationMode) var presentationMode
    @Binding var selectedImage: Image
    
    init(selectedImage: Binding<Image>) {
        _selectedImage = selectedImage
    }
}

// MARK: - UIViewController Representable

extension ImagePicker: UIViewControllerRepresentable {
    
    func makeUIViewController(context: CustomImagePicker) -> UIImagePickerController {
        UIImagePickerController()
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: CustomImagePicker) { 
        uiViewController.sourceType = .photoLibrary
        uiViewController.delegate = context.coordinator
    }
    
    func makeCoordinator() -> ImagePickerCoordinator {
        ImagePickerCoordinator(self)
    }
}
