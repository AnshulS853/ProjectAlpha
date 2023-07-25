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


////~TEMPORARY FUNCTIONALITY ADDED FOR DEVELOPMENT~
////Added functionality to save the scanned document to photos library
////Added permission in info.plist to add photos into library
////--REMOVE THIS PERMISSION IF FUNCTIONALITY IS REMOVED
//
//import SwiftUI
//import VisionKit
//import Photos
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
//            // Access scanned images from `scan` and perform any required operations
//            for pageIndex in 0 ..< scan.pageCount {
//                let image = scan.imageOfPage(at: pageIndex)
//                saveImageToPhotoLibrary(image)
//            }
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
//
//        private func saveImageToPhotoLibrary(_ image: UIImage) {
//            PHPhotoLibrary.shared().performChanges {
//                PHAssetChangeRequest.creationRequestForAsset(from: image)
//            } completionHandler: { (_, error) in
//                if let error = error {
//                    // Handle error while saving the image
//                    // --For diagnostic development purposes > Remove
//                    print("Error saving image to photo library: \(error)")
//                } else {
//                    // Image saved successfully
//                    print("Image saved to photo library")
//                }
//            }
//        }
//    }
//}

import SwiftUI
import VisionKit
import PDFKit

struct DocumentScannerView: UIViewControllerRepresentable {
    typealias UIViewControllerType = VNDocumentCameraViewController

    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentScannerViewController = VNDocumentCameraViewController()
        documentScannerViewController.delegate = context.coordinator
        return documentScannerViewController
    }

    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        // No update needed
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            
            // Convert VNDocumentCameraScan to PDF and save it in the app's document directory
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let pdfURL = documentDirectory.appendingPathComponent(UUID().uuidString).appendingPathExtension("pdf")
            let pdfData = scanToPDF(scan)
            try? pdfData.write(to: pdfURL)

            // Dismiss the document scanner view
            controller.dismiss(animated: true)
        }
        
        func scanToPDF(_ scan: VNDocumentCameraScan) -> Data {
            let pdfDocument = PDFDocument()

            for pageIndex in 0..<scan.pageCount {
                let image = scan.imageOfPage(at: pageIndex)
                if let pdfPage = PDFPage(image: image) {
                    pdfDocument.insert(pdfPage, at: pageIndex)
                }
            }

            return pdfDocument.dataRepresentation() ?? Data()
        }

        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            // Handle cancellation here if needed
            controller.dismiss(animated: true)
        }

        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            // Handle error here if needed
            controller.dismiss(animated: true)
        }
    }
}
