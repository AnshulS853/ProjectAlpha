//import SwiftUI
//import VisionKit
//
//struct DocumentScannerView: UIViewControllerRepresentable {
//    typealias UIViewControllerType = VNDocumentCameraViewController
//
//    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
//        let documentScannerViewController = VNDocumentCameraViewController()
//        documentScannerViewController.delegate = context.coordinator
//        return documentScannerViewController
//    }
//
//    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
//        // No update needed
//    }
//
//    func makeCoordinator() -> Coordinator {
//        Coordinator()
//    }
//
//    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
//        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
//            // Process scanned document here
//            // Access scanned images from `scan` and perform any required operations
//            // For example, can save the scanned images, extract text, etc.
//
//            // Dismiss the document scanner view
//            controller.dismiss(animated: true)
//        }
//
//        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
//            // Handle cancellation here if needed
//            controller.dismiss(animated: true)
//        }
//
//        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
//            // Handle error here if needed
//            controller.dismiss(animated: true)
//        }
//    }
//}


//~TEMPORARY FUNCTIONALITY ADDED FOR DEVELOPMENT~
//Added functionality to save the scanned document to photos library
//Added permission in info.plist to add photos into library
//--REMOVE THIS PERMISSION IF FUNCTIONALITY IS REMOVED

import SwiftUI
import VisionKit
import Photos

struct DocumentScannerView: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(completion: completionHandler)
    }

    final class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        private let completionHandler: ([String]?) -> Void
        
        init(completion: @escaping ([String]?) -> Void) {
            self.completionHandler = completion
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            let recogniser = TextRecogniser(cameraScan: scan)
            recogniser.recogniseText(withCompletionHandler: completionHandler)
            
            for pageIndex in 0 ..< scan.pageCount {
                let image = scan.imageOfPage(at: pageIndex)
                saveImageToPhotoLibrary(image)
            }
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            // Handle cancellation here if needed
            controller.dismiss(animated: true)
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            // Handle error here if needed
            controller.dismiss(animated: true)
        }
        
        private func saveImageToPhotoLibrary(_ image: UIImage) {
            PHPhotoLibrary.shared().performChanges {
                PHAssetChangeRequest.creationRequestForAsset(from: image)
            } completionHandler: { (_, error) in
                if let error = error {
                    // Handle error while saving the image
                    // --For diagnostic development purposes > Remove
                    print("Error saving image to photo library: \(error)")
                } else {
                    // Image saved successfully
                    print("Image saved to photo library")
                }
            }
        }
    }
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentScannerViewController = VNDocumentCameraViewController()
        documentScannerViewController.delegate = context.coordinator
        return documentScannerViewController
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // No update needed
    }

    typealias UIViewControllerType = VNDocumentCameraViewController
    
    private let completionHandler: ([String]?) -> Void
    
    init(completion: @escaping ([String]?) -> Void) {
        self.completionHandler = completion
    }
}
