//
//
// ImageSaver.swift
// Instafilter
//
// Created by Solygambas on 21/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import SwiftUI

class ImageSaver: NSObject {
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveCompleted), nil)
    }
    
    @objc func saveCompleted(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
    }
}
