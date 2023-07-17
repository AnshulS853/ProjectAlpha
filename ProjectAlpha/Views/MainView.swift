import SwiftUI

struct MainView: View {
    var body: some View{
        NavigationView{
            VStack{
                Text("Project Alpha")
                    .font(.system(size:50))
                    .fontWeight(.semibold)
                    .padding(.top, 30.0)

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

                NavigationLink(destination: CameraView()){
                    VStack{
                        Image(systemName: "camera.fill")
                            .font(.system(size:40))
                            .foregroundColor(Color.red)
                        Text("Scan receipt")
                            .foregroundColor(Color.gray)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
