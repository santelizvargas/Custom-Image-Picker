# 📷 Custom Image Picker in SwiftUI 📷

This repository contains a custom image picker component developed in SwiftUI.

## 📝 Description

The Custom Image Picker provides a user-friendly interface for selecting images within a defined range. It offers customization options to match various design and functionality requirements.

## ✨ Features

- Intuitive interface for selecting images.
- Customizable appearance and behavior.
- Version iOS14.0+

## 🚀 Usage

To integrate the Custom Image Picker into your SwiftUI project, follow the installation steps detailed in the documentation included in this repository.

```swift
struct ContentView: View {
    @State private var selectedImages: [Image] = []
    
    var body: some View {
        VStack {
            Text("Selected Images: \(selectedImages.count)")
            
            CustomImagePickerView(selectedImages: $selectedImages)
        }
    }
}
