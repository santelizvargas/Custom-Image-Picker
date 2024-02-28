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
```

## 🎬 Demo
A demonstration is included to showcase the Custom Image Picker in action. Refer to the demo files for more information on how to use this component in your own projects

<img width="335" alt="image" src="https://github.com/santelizvargas/Custom-Image-Picker/assets/79380665/b9021133-a12c-4014-9ffc-c08c06b3dc94">
<img width="336" alt="image" src="https://github.com/santelizvargas/Custom-Image-Picker/assets/79380665/fd183780-47b5-43e1-90fe-6c0dfa5914ed">

### Video Demo
![Simulator Screen Recording - iPhone 15 Pro - 2024-02-27 at 21 15 39](https://github.com/santelizvargas/Custom-Image-Picker/assets/79380665/310f7cc9-7f1a-4844-b69a-9ffdb5d43c0e)


## 🤝 Contributing
If you'd like to contribute to this project, you're welcome to do so! Feel free to open an issue or submit a pull request with your improvements.

## 📧 Contact
If you have any questions or suggestions, feel free to contact the development team via [email](mailto:ushija6@gmail.com).
