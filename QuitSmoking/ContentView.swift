//
//  ContentView.swift
//  QuitSmoking
//
//  Created by Rangga Biner on 09/08/24.
//

import SwiftUI
import OpenAI

class ChatController: ObservableObject {
    @Published var messages: [MessageModel] = []

    let openAI = OpenAI(apiToken: "Secret API")
    
    init() {
        let initialBotMessage = MessageModel(content: "Hai! 😊 Gw ChatPadil, konselor lo. Gw di sini buat bantu lo berhenti ngerokok pake pendekatan Cognitive Behavioral Therapy (CBT). Nama lo siapa nih? 🤗", isUser: false)
        self.messages.append(initialBotMessage)
    }
    
    func sendNewMessage(content: String) {
        let userMessage = MessageModel(content: content, isUser: true)
        self.messages.append(userMessage)
        getBotReply()
    }
    
    func getBotReply() {
        let initialPrompt = """
    Lo adalah seorang konselor yang bantu klien berhenti ngerokok dengan pake pendekatan Cognitive Behavioral Therapy (CBT). Lo harus nanya secara bertahap buat gali info dari klien. Jangan langsung jelasin keseluruhan sesi pertama CBT. Ajukan pertanyaan yang bantu klien buat merenung dan kasih info lebih lanjut. Gunain bahasa Indonesia yang santai, ramah, gaul, dan sertakan emotikon buat bangkitin suasana. Pastikan juga lo bisa ngasih solusi dan saran tanpa kehabisan topik obrolan. Fokus pada peran lo sebagai konselor CBT dan jangan bahas hal lain di luar konteks ini.
    Ketika sesi pertama sudah selesai, rangkum percakapan dan berikan solusi serta motivasi. Kasih tau klien bahwa sesi pertama CBT sudah selesai
    """
        
        let combinedMessages = [MessageModel(content: initialPrompt, isUser: false)] + self.messages
        
        let query = ChatQuery(
            messages: combinedMessages.map({
                .init(role: $0.isUser ? .user : .system, content: $0.content)!
            }),
            model: .gpt4_o_mini
        )
        
        openAI.chats(query: query) { result in
            switch result {
            case .success(let success):
                guard let choice = success.choices.first else {
                    return
                }
                guard let message = choice.message.content?.string else { return }
                DispatchQueue.main.async {
                    self.messages.append(MessageModel(content: message, isUser: false))
                }
            case .failure(let failure):
                print(failure)
            }
        }
    }
}



struct ContentView: View {
    @StateObject var chatController: ChatController = .init()
    @State var string: String = ""
    var body: some View {
        VStack {
            ScrollView {
                ForEach(chatController.messages) { message in
                    MessageView(message: message)
                        .padding(5)
                }
            }
            Divider()
            HStack {
                TextField("Message...", text: self.$string, axis: .vertical)
                    .padding(5)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(15)
                Button {
                    self.chatController.sendNewMessage(content: string)
                    string = ""
                } label: {
                    Image(systemName: "paperplane")
                }
            }
            .padding()
        }
    }
}

struct MessageView: View {
    var message: MessageModel
    var body: some View {
        Group {
            if message.isUser {
                HStack {
                    Spacer()
                    Text(message.content)
                        .padding()
                        .background(Color.secondary)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                }
            } else {
                HStack {
                    Text(message.content)
                        .padding()
                        .background(Color.primary)
                        .foregroundColor(Color.white)
                        .clipShape(Rectangle())
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
