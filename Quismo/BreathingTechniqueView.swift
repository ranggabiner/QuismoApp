import SwiftUI
import AVKit

struct BreathingTechniqueView: View {
    @Environment(\.presentationMode) private var presentationMode
    
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "BreathingVideo", withExtension: "mov")!)
    @State var isPlaying: Bool = true
    
    var body: some View {
        ZStack{
            VideoPlayer(player: player)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()
            //                .frame(width: 320, height: 180, alignment: .center)
                .allowsHitTesting(/*@START_MENU_TOKEN@*/false/*@END_MENU_TOKEN@*/)
            VStack {
                Spacer()
                
                Button {
                    isPlaying ? player.pause() : player.play()
                    isPlaying.toggle()
                } label: {
                    ZStack {
                        // Circular background
                        Circle()
                            .fill(Color.white.opacity(0.7)) // Background color and opacity
                            .frame(width: 60, height: 60) // Size of the circle
                        
                        // Image
                        Image(systemName: isPlaying ? "stop" : "play")
                            .foregroundColor(.blueTint1)
                            .font(.system(size: 24, weight: .bold)) // Adjust image size and weight
                    }
                }
            }
        }
        .onAppear{
            player.play()
            addObserver()
        }
        .onDisappear{
            removeObserver()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            // Customize the back button
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    // Handle the back button action
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
        }
        .background(NavigationConfigurator { nc in
            nc.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            nc.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        })
    }
    
    func addObserver(){
        Foundation.NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: nil) { notif in
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func removeObserver() {
        NotificationCenter.default.removeObserver(self,
                                                  name: .AVPlayerItemDidPlayToEndTime,
                                                  object: nil)
    }
}

struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if let nc = uiViewController.navigationController {
            configure(nc)
        }
    }
}

#Preview {
    BreathingTechniqueView()
}
