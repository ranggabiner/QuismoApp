//
//  ChatBuddyView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 23/08/24.
//

import SwiftUI

struct ChatBuddyView: View {
    @ObservedObject var viewModel = ChatBuddyViewModel(chatUseCase: ChatBuddyUseCase(repository: LocalUserRepository()))
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 0) {
            headerView
            messagesScrollView
            inputView
        }
        .onAppear {
            viewModel.loadInitialData()
        }
    }

    private var headerView: some View {
        HStack(spacing: 16) {
            Spacer()
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
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.vertical)
        .background(Color.blueShade3)
    }

    private var messagesScrollView: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack {
                    ForEach(Array(viewModel.companionMessages.enumerated()), id: \.element.id) { index, message in
                        CompanionMessageView(message: message, isFirstMessage: index == 0)
                            .padding(EdgeInsets(top: 0, leading: 23, bottom: 20, trailing: 23))
                            .id(message.id)
                    }
                }
            }
            .scrollDismissesKeyboard(.interactively)
            .onChange(of: viewModel.companionMessages) { _ in
                if let lastMessage = viewModel.companionMessages.last {
                    withAnimation {
                        proxy.scrollTo(lastMessage.id, anchor: .bottom)
                    }
                }
            }
            .onAppear {
                if let lastMessage = viewModel.companionMessages.last {
                    proxy.scrollTo(lastMessage.id, anchor: .bottom)
                }
            }
        }
    }

    private var inputView: some View {
        VStack {
            HStack(spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    TextField("", text: $viewModel.inputText, axis: .vertical)
                        .lineLimit(5)
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(Color.blueShade3)
                        .padding(EdgeInsets(top: 8, leading: 22, bottom: 8, trailing: 46))
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.bluePrimary, lineWidth: 4)
                        )
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    if !viewModel.inputText.isEmpty {
                        Button(action: viewModel.sendMessage) {
                            Image(systemName: "arrow.up.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.bluePrimary)
                        }
                        .disabled(viewModel.isLoading)
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 8, trailing: 8))
                    }
                }
            }
            .padding(EdgeInsets(top: 0, leading: 21, bottom: 16, trailing: 21))
            .padding(.top, 10)
        }
    }
}
