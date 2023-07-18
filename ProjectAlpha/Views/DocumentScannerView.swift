import SwiftUI
import VisionKit

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
            // Process scanned document here
            // Access scanned images from `scan` and perform any required operations
            // For example, can save the scanned images, extract text, etc.

            // Dismiss the document scanner view
            controller.dismiss(animated: true)
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
