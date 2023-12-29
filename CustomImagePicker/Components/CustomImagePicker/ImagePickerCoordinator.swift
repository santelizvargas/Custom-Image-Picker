//
//  ImagePickerCoordinator.swift
//  CustomImagePicker
//
//  Created by Brandon Santeliz on 28/12/23.
//

import SwiftUI


final class ImagePickerCoordinator: NSObject {
    
    private var parent: ImagePicker
    
    init(_ parent: ImagePicker) {
        self.parent = parent
    }
}

// MARK: - UIImagePicker Controller Delegate

extension ImagePickerCoordinator: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            parent.selectedImage = Image(uiImage: image)
        }
        parent.presentationMode.wrappedValue.dismiss()
    }
}

// MARK: - UINavigationController Delegate

extension ImagePickerCoordinator: UINavigationControllerDelegate { }

