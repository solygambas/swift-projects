//
//
// FileManager-DocumentsDirectory.swift
// Nameger
//
// Created by Solygambas on 23/05/2022
// Copyright © 2022 Solygambas. All rights reserved.
//
        

import Foundation
import UIKit
        

class ImageSaver: NSObject {
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func writeToSecureDirectory(uiImage: UIImage, id: UUID) -> URL? {
        if let jpegData = uiImage.jpegData(compressionQuality: 0.8) {
            let url = self.getDocumentsDirectory().appendingPathComponent("\(id).jpg")
            print(url)
            try? jpegData.write(to: url, options: [.atomic, .completeFileProtection])
            return url
        }
        return nil
    }
}
