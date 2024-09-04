//
//  UIImageHolder.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/4/24.
//

import SwiftUI
import UIKit

struct UIImageHolder: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let controller = ImageViewController(nibName: "ImageViewController", bundle: nil)
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

