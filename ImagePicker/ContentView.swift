//
//  ContentView.swift
//  ImagePicker
//
// by Developer Light on 18.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()
    var body: some View {
        VStack {
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth:0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)
            
            Button {
                self.isShowPhotoLibrary = true
            } label: {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo Library")
                }
                .frame(minWidth:0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.primary)
                .foregroundColor(.white)
                .cornerRadius(1)
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
