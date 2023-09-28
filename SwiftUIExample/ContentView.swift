//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Adrian García on 13/6/23.
//

import SwiftUI
import AliceOnboarding

struct ContentView: View {
    @State var isPresented = false
    
    var body: some View {
        Button("MyViewController") {
            isPresented = true
        }
        .sheet(isPresented: $isPresented) {
            MyView()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct MyView: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> ViewControllerBridge {
        let vc = ViewControllerBridge()
        // Do some configurations here if needed.
        return vc
    }
    
    func updateUIViewController(_ uiViewController: ViewControllerBridge, context: Context) {
        // Updates the state of the specified view controller with new information from SwiftUI.
        
        let userInfo = UserInfo(email: "demo@swift.ui")
        
        let authenticator = TrialAuthenticator(trialToken: "", userInfo: userInfo)
        
        
        authenticator.execute { result in
            switch result {
            case .success(let userToken):
                var config: OnboardingConfig
                
                config = OnboardingConfig.builder()
                    .withUserToken(userToken)
                    
                
                config = try! config.withAddSelfieStage()
                config = try! config.withAddDocumentStage(ofType: DocumentType.driverlicense)

                let onboarding = Onboarding(uiViewController, config: config)
                
                onboarding.run { result in
                    
                }
            case .failure(let error):
                break
            }
        }
    }
}
