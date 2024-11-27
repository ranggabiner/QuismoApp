//
//  ChatSessionView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct ChatSessionView: View {
    @ObservedObject var chatController: ChatController
    var sessionId: Int
    @State private var string: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State var tabBarVisibility: Visibility = .hidden

    var body: some View {
        VStack (spacing: 0) {
            HStack(spacing: 16) {
                ZStack {
                    VStack {
                    Circle()
                            .fill(Color.white)
                            .frame(width: 55, height: 55)
                            .overlay(
                                Image("poppyProfile")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipShape(Circle())
                            )
                            .shadow(radius: 3)
                        
                        Text("Poppy")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                    HStack(spacing: 0) {
                        Button(action: {
                            tabBarVisibility = .visible
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "chevron.backward")
                                .font(.system(size: 27, weight: .semibold))
                                .foregroundStyle(Color.white)
                        }
                        Spacer()
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical)
            .background(Color.black.opacity(0.50))
            
            ScrollViewReader { proxy in
                ScrollView {
                    VStack {
                        ForEach(Array(chatController.messages.enumerated()), id: \.element.id) { index, message in
                            MessageView(message: message, isFirstMessage: index == 0)
                                .padding(EdgeInsets(top: 0, leading: 23, bottom: 20, trailing: 23))
                                .id(message.id)
                        }
                    }
                }
                .scrollDismissesKeyboard(.interactively)
                .onChange(of: chatController.messages) { _ in
                    if let lastMessage = chatController.messages.last {
                            proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
                .onAppear {
                    if let lastMessage = chatController.messages.last {
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
            }
            .onChange(of: chatController.messages) { _ in
                chatController.checkSessionCompletion()
            }

            VStack {
                HStack(spacing: 0) {
                    ZStack(alignment: .bottomTrailing) {
                            TextField("", text: $string, axis: .vertical)
                                .lineLimit(5)
                                .font(.system(size: 20, weight: .medium))
                                .foregroundStyle(Color.blueShade3)
                                .padding(EdgeInsets(top: 8, leading: 22, bottom: 8, trailing: 46))
                             
                        .background(Color.blueTint3)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        if !string.isEmpty {
                            Button {
                                chatController.sendNewMessage(content: string)
                                string = ""
                            } label: {
                                Image(systemName: "arrow.up.circle.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .foregroundColor(Color.bluePrimary)
                            }
                            .disabled(chatController.isSessionCompleted(sessionId) || chatController.isLoading)
                            .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8))
                        }
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 21, bottom: 16, trailing: 21))
                .padding(.top, 10)
            }
            .disabled(chatController.isSessionCompleted(sessionId))
        }
        .background(Color.bluePrimary)

        .toolbar(tabBarVisibility, for: .tabBar)
        .gesture(
            DragGesture()
                .onEnded { value in
                    if value.translation.width > 100 {
                        tabBarVisibility = .visible
                        presentationMode.wrappedValue.dismiss()
                    }
                }
        )
        .onAppear {
            chatController.switchSession(to: sessionId)
            chatController.markSessionAsAccessed(sessionId)
        }
    }
}
