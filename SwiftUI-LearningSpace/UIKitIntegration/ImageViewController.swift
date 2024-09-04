//
//  ImageViewController.swift
//  SwiftUI-LearningSpace
//
//  Created by Ahmad Remote on 9/4/24.
//

import UIKit

class ImageViewController: UIViewController {
    let context = CIContext(options: nil)
    func convertCIImageToCGImage(inputImage: CIImage) -> CGImage? {
        if let cgImage = context.createCGImage(inputImage, from: inputImage.extent) {
            return cgImage
        }
        return nil
    }
    
    func image() -> [UIImage] {
        var imageArray = [UIImage]()
        if let uiImage = UIImage(named: "StreetImage")
        {
            if let ciimage = CIImage(image: uiImage)
            {
                var prevX = 0.0
                var prevY = 0.0
                for x in 1...9
                {
                    for y in 1...4
                    {
                        var rect = CGRect(x: prevX * 50.0, y: prevY * 50.0, width: 50.0, height: 50.0)
                        var clampedCIImage = ciimage.clamped(to: rect)

                        var croppedCIImage = clampedCIImage.cropped(to: rect)
                        let cgImage = convertCIImageToCGImage(inputImage: croppedCIImage)!
                        let img = UIImage(cgImage: cgImage)
                        imageArray.append(img)
                        prevY = Double(y)
                    }
                    prevX = Double(x)
                }
               
                
                return imageArray
            }
        }
        return imageArray
    }
    // show this successfully through Swift UI
    // Show this with a default image at the top
    // pass this the UIImages and have it display them
    // measure to see if this is faster
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
