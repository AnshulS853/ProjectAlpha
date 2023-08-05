import SwiftUI
import VisionKit

//adding vcs test comment

struct MainView: View {

    //Flag set to enable document scanner upon button press
    @State private var showDocumentScanner = false
    @State private var texts: [ScanData] = []

    var body: some View{
        NavigationView{
            VStack{
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
                    makeScannerView()
                }
            }
        }
    }
    func makeScannerView() -> DocumentScannerView {
        let scanner = DocumentScannerView(completion: {
            textPerPage in
            if let outputText = textPerPage?.joined(separator: "\n").trimmingCharacters(in: .whitespacesAndNewlines) {
                let newScanData = ScanData(content: outputText)
                self.texts.append(newScanData)
            }
        })
        self.showDocumentScanner = false
        return scanner
    }
    
}

//Code for preview window in Xcode
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
