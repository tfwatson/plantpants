////
////  ContentView.swift
////  DocPlanty
////
////  Created by Zeke Reyes on 3/28/24.
////
//
//import SwiftUI
//import OpenAI
//
//class ChatController: ObservableObject {
//    @Published var messages: [Message] = []
//    
//    
//    func sendNewMessage(content: String) {
//        let userMessage = Message(content: content, isUser: true)
//        self.messages.append(userMessage)
//        getBotReply()
//    }
//    
//    func getBotReply() {
//
//        openAI.chats(query: .init(model: .gpt3_5Turbo,
//                                  messages: self.messages.map({Chat(role: .user, content: $0.content)}))) { result in
//            switch result {
//            case .success(let success):
//                guard let choice = success.choices.first else {
//                    return
//                }
//                let message = choice.message.content
//                DispatchQueue.main.async {
//                    self.messages.append(Message(content: message ?? "", isUser: false))
//                }
//            case .failure(let failure):
//                print(failure)
//            }
//        }
//    }
//}
//
//struct Message: Identifiable {
//    var id: UUID = .init()
//    var content: String
//    var isUser: Bool
//}
//
//enum ChatMessageDirection {
//    case left
//    case right
//}
//
//struct DocPlantyView: View {
//    @StateObject var chatController: ChatController = .init()
//    @State var string: String = ""
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                Image("Dr. Planty")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .clipShape(Circle())
//                    .frame(width: 100, height: 100) // Adjust size as needed
//                    .padding(.bottom, 5) // Add padding to push the image down
//                ScrollView {
//                    ForEach(chatController.messages) { message in
//                        MessageView(message: message, direction: message.isUser ? .right : .left)
//                            .padding(5)
//                    }
//                }
//                
//                Divider()
//                HStack {
//                    TextField("Message...", text: self.$string, axis: .vertical)
//                        .padding(5)
//                        .background(Color.gray.opacity(0.1))
//                        .cornerRadius(15)
//                    Button {
//                        self.chatController.sendNewMessage(content: string)
//                        string = ""
//                        // Resets the message field by resigning the focus explicitly
//                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
//                    } label: {
//                        Image(systemName: "paperplane")
//                    }
//                }
//                .padding()
//            }
//            .navigationBarTitle("Doctor Planty", displayMode: .inline)
//        }
//    }
//}
//
//
//struct MessageView: View {
//    var message: Message
//    var direction: ChatMessageDirection
//    
//    var body: some View {
//        HStack {
//            if message.isUser {
//                Spacer()
//                Text(message.content)
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(Color.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
//                    .listRowSeparator(.hidden)
//                    .overlay(alignment: .bottomTrailing) {
//                        Image(systemName: "arrowtriangle.down.fill")
//                            .font(.title)
//                            .rotationEffect(.degrees(-45))
//                            .offset(x: 10, y: 10)
//                            .foregroundColor(.blue)
//                    }
//            } else {
//                Text(message.content)
//                    .padding()
//                    // Just goofin with da colors maynnnne
//                    .background(Color(uiColor: .systemGray))
//                    .foregroundColor(Color.white)
//                    .clipShape(RoundedRectangle(cornerRadius: 16.0, style: .continuous))
//                    .overlay(alignment: .bottomLeading) {
//                        Image(systemName: "arrowtriangle.down.fill")
//                            .font(.title)
//                            .rotationEffect(.degrees(45))
//                            .offset(x: -10, y: 10)
//                            .foregroundColor(.gray)
//                    }
//                Spacer()
//            }
//        }
//        .alignmentGuide(.leading) { dimension in
//            if message.isUser {
//                return dimension[.trailing]
//            } else {
//                return dimension[.leading]
//            }
//        }
//    }
//}
//
//
//
//#Preview {
//    ContentView()
//}
//
