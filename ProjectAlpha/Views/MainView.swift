import SwiftUI
import VisionKit

//adding vcs test comment

struct MainView: View {
    //Flag set to enable document scanner upon button press
    @State private var showDocumentScanner = false
<<<<<<< HEAD

    var body: some View{
        NavigationView{
            VStack{
=======
    // array of the texts (along with UUID) that have been returned from the text recognition
    @State private var scannedTexts: [RecognisedTextFormat] = []
    
    var body: some View {
        NavigationView {
            VStack {
>>>>>>> 9d4877e (minor changes)
                //Main title
                Text("Project Alpha")
                    .font(.system(size:50))
                    .fontWeight(.semibold)
                    .padding(.top, 30.0)

                //Navigation handler assgined to gear icon from SF pack directed to SettingsView file
                NavigationLink(destination: SettingsView()){
                    HStack{
                        Image(systemName: "gearshape")
                            .padding(.leading, 40.0)
                            .padding(.top, -20.0)
                            .font(.system(size:30))
                            .foregroundColor(Color.red)
                    }
                    Spacer()
                }

                Spacer()

                //Button directed to DocumentScannerView file
                Button {
                    //Flag set to true upon button press to open camera
                    self.showDocumentScanner = true
                } label: {
                    //Camera button from SF symbol pack
                        VStack{
                            Image(systemName: "camera.fill")
                                .font(.system(size:40))
                                .foregroundColor(Color.red)
                            Text("Scan receipt")
                                .foregroundColor(Color.gray)
                        }
                }
                
                //present the sheet with document scanner and call window
                .sheet(isPresented: $showDocumentScanner) {
                    DocumentScannerView()
                }
            }
        }
    }
<<<<<<< HEAD
=======
    // this creates the DocumentScannerView, and once completed (document has been scanned) will format the text into an array for each document that was scanned
    func makeScannerView() -> DocumentScannerView {
        // iterate over each document that was scanned
        let scanner = DocumentScannerView(completion: {
            textPerPage in
            // if there is scanned text from the document scanner, then append to the scannedTexts array.
            // format all the text from each page (this can be made its own function later on for readability)
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                // create a new data scan struct
                let newScanData = RecognisedTextFormat(content: outputText)
                self.scannedTexts.append(newScanData)
            }
        })
        return scanner
    }
    
>>>>>>> 9d4877e (minor changes)
}

//Code for preview window in Xcode
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
