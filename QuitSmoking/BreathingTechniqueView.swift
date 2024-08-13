import SwiftUI

struct BreathingTechniqueView: View {
    @State private var breathPhase: Int = 0
    @State private var circleScale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            VStack {
                Text("4-7-8 Breathing")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding()
                
                Spacer()
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 200, height: 200)
                    .scaleEffect(circleScale)
                    .onAppear {
                        startBreathing()
                    }
                    .animation(.easeInOut(duration: durationForPhase(phase: breathPhase)), value: circleScale)
                
                Spacer()
                
                Text(phaseDescription(phase: breathPhase))
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
    
    func startBreathing() {
        animateBreathing() // Start the breathing cycle immediately

        Timer.scheduledTimer(withTimeInterval: 19, repeats: true) { _ in
            animateBreathing()
        }
    }
    
    func animateBreathing() {
        breathPhase = 0
        withAnimation {
            circleScale = 2.0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            breathPhase = 1
            withAnimation {
                circleScale = 2.0
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                breathPhase = 2
                withAnimation {
                    circleScale = 1.0
                }
            }
        }
    }
    
    func durationForPhase(phase: Int) -> Double {
        switch phase {
        case 0: return 4.0 // Inhale for 4 seconds
        case 1: return 7.0 // Hold for 7 seconds
        case 2: return 8.0 // Exhale for 8 seconds
        default: return 0
        }
    }
    
    func phaseDescription(phase: Int) -> String {
        switch phase {
        case 0: return "Inhale"
        case 1: return "Hold"
        case 2: return "Exhale"
        default: return ""
        }
    }
}

#Preview {
    BreathingTechniqueView()
}
