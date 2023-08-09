import SwiftUI
import VisionKit

struct MainView: View {

    //Flag set to enable document scanner upon button press
    @State private var showDocumentScanner = false
    @State private var showPDF = false // This will be used to control the showing of the sheet
    @State private var selectedDocumentURL: URL?

    var body: some View{
        NavigationView{
            VStack{
                //Main title
                Text("Project Alpha")
                    .font(.system(size:50))
                    .fontWeight(.semibold)
                    .padding(.top, 30.0)

                //Navigation handler assigned to gear icon from SF pack directed to SettingsView file
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

                // Add a ScrollView to show all PDF documents in a grid
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]) {
                        ForEach(getDocumentURLs(), id: \.self) { url in
                            Button(action: {
                                selectedDocumentURL = url
                                showPDF = true // Set showPDF to true when a document is selected
                            }) {
                                Text(url.lastPathComponent)
                                    .padding()
                            }
                        }
                    }
                }
                .sheet(isPresented: $showPDF) {
                    if let url = selectedDocumentURL {
                        PDFKitView(url: url)
                    }
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

    func getDocumentURLs() -> [URL] {
        let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let urls = try? FileManager.default.contentsOfDirectory(at: documentDirectory, includingPropertiesForKeys: nil)
        return urls?.filter { $0.pathExtension == "pdf" } ?? []
    }
}

//Code for preview window in Xcode
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
