import SwiftUI
import PDFKit

struct PDFKitView: View {
    var url: URL

    var body: some View {
        PDFKitRepresentedView(url: url)
    }
}

//struct PDFKitRepresentedView: UIViewRepresentable {
//    var url: URL
//
//    func makeUIView(context: Context) -> PDFView {
//        let pdfView = PDFView()
//
//        if let document = PDFDocument(url: url) {
//            pdfView.document = document
//        }
//
//        return pdfView
//    }
//
//    func updateUIView(_ uiView: PDFView, context: Context) {
//    }
//}
struct PDFKitRepresentedView: UIViewRepresentable {
    var url: URL

    func makeUIView(context: Context) -> PDFView {
        let pdfView = PDFView()

        if let document = PDFDocument(url: url) {
            pdfView.document = document
        }

        pdfView.autoScales = true // Add this line

        return pdfView
    }

    func updateUIView(_ uiView: PDFView, context: Context) {
    }
}
