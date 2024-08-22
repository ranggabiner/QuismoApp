//
//  DashboardView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 17/08/24.
//

import SwiftUI

//struct DashboardView: View {
//    @State private var cigAvoided: Int = 0
//    @State private var moneySaved: Int = 0
//    @State private var smokeFree: Int = 0
//
//    var body: some View {
//        HStack {
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("\(cigAvoided)")
//                Text("Cig Avoided")
//            }
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("Rp. \(moneySaved)")
//                Text("Money Saved")
//            }
//            Spacer()
//            VStack {
//                Image(systemName: "star")
//                Text("\(smokeFree)")
//                Text("Smoke Free")
//            }
//            Spacer()
//        }
//        .onAppear {
//            let dashUserDefault = UserDefaults.standard
//            let dashCigPerDay = dashUserDefault.integer(forKey: "userCigsPerDay")
//            let dashCigPerPack = dashUserDefault.integer(forKey: "userCigsPerPack")
//            let dashPricePerPack = dashUserDefault.integer(forKey: "userPricePerPack")
//            let timeElapsed = 2
//
//            cigAvoided = dashCigPerDay * timeElapsed
//            if dashCigPerPack > 0 { // Ensure there's no division by zero
//                    moneySaved = (dashPricePerPack / dashCigPerPack) * (dashCigPerDay * timeElapsed)
//                } else {
//                    moneySaved = 0 // Or handle the case as needed
//                }
//            smokeFree = timeElapsed
//        }
//    }
//}
//
//#Preview {
//    DashboardView()
//}

struct DashboardView: View {
    var viewModel = OnBoardingViewModel(onBoardingUseCase: OnBoardingUseCase(repository: LocalUserRepository()))
    @State private var cigAvoided: Int = 0
    @State private var moneySaved: Int = 0
    @State private var smokeFree: Int = 0
    @State private var selectedDate: Date?
    @State private var quitReasons: [String] = []
    @Binding var user: UserModel
    
    var body: some View {
        ZStack {
//            Color("Primary")
//                .ignoresSafeArea()
            ScrollView {
                ZStack {
                    
                    //background biru
                    ZStack {
                        Rectangle()
                            .frame(width: 393, height: 1000)
                            .foregroundColor(Color("Primary"))
                            .padding(.bottom, 576)
                    }
                    .frame(height: 276)
                    
                    //moon
                    ZStack {
                        Circle()
                            .frame(width: 400, height: 400)
                            .foregroundColor(Color("BlueTint1"))
                            .opacity(0.5)
                        Circle()
                            .frame(width: 300, height: 300)
                            .foregroundColor(Color("BlueTint2"))
                            .opacity(0.5)
                        Circle()
                            .frame(width: 175, height: 175)
                            .foregroundColor(Color("BlueTint3"))
                            .opacity(0.5)
                    }
                    .offset(x: 150, y: -500)

                    
                    //easter egg
                    ZStack {
                        Image("PoppyEasterEgg")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .offset(x: 0, y: -700)
                    }
                    
                    //poppy
                    ZStack {
                        Image("HappyPoppy")
                            .resizable()
                            .frame(width: 336, height: 326)
                    }
                    .offset(x: -75, y: -305)

                    ZStack {
                        Rectangle()
                            .frame(width: 142, height: 60)
                            .foregroundColor(Color("White"))
                            .shadow(radius: 8)
                            .cornerRadius(15)
                        
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("White"))
                            .shadow(radius: 8)
                            .padding(.top, 60)
                            .padding(.trailing, 125)
                        
                        Text("Let's start your journey!")
                            .frame(width: 120)
                            .foregroundColor(Color("Primary"))
                            .font(.system(size: 18, weight: .semibold))
                            .lineLimit(2)
                    }
                    // bubble chat dpn
                    ZStack {
                        Rectangle()
                            .frame(width: 142, height: 60)
                            .foregroundColor(Color("White"))
//                            .shadow(radius: 4)

                            .cornerRadius(15)
                        
                        Circle()
                            .frame(width: 18, height: 18)
                            .foregroundColor(Color("White"))
//                            .shadow(radius: 4)

                            .padding(.top, 60)
                            .padding(.trailing, 125)
                        
                        Text("Let's start your journey!")
                            .frame(width: 120)
                            .foregroundColor(Color("Primary"))
                            .font(.system(size: 18, weight: .semibold))
                            .lineLimit(2)
                    }
                    .offset(x: 81, y: -380)
                    
                    //session
                    Rectangle()
                        .frame(width: 393, height: 576)
                        .foregroundColor(Color("White"))
                        .padding(.top, 75)
                    

                    ZStack {
                        
                        VStack {
                            HStack {
                                Text("Let's Talk!")
                                    .multilineTextAlignment(.leading)
                                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                                    .foregroundColor(Color("Primary"))
                                    .padding(.leading, 20)
                                    .padding(.bottom, 0)
                                    .padding(.top, 75)

                                Spacer()
                            }
                            Rectangle()
                                .frame(width: 353, height: 100)
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(15)
                                .padding(.bottom, 10)

                            Rectangle()
                                .frame(width: 353, height: 100)
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(15)
                                .padding(.bottom, 10)
                            Rectangle()
                                .frame(width: 353, height: 100)
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(15)
                                .padding(.bottom, 10)

                            Rectangle()
                                .frame(width: 353, height: 100)
                                .foregroundColor(Color("Primary"))
                                .cornerRadius(15)
                                .padding(.bottom, 10)

//                            Rectangle()
//                                .frame(width: 353, height: 100)
//                                .foregroundColor(Color("Primary"))
//                                .cornerRadius(15)
                        }
                        .frame(width: 393)
//                        .padding(.top, 276)
                        .padding(.top, 75)
                    }
                    
                    //insight box

                    ZStack {
                        Rectangle()
                            .frame(width: 353, height: 100)
                            .foregroundColor(Color("White"))
                            .cornerRadius(15)
                            .shadow(radius: 4)
                            .offset(x: 0, y: -250)
                        

                        ZStack {
                            VStack {
                                HStack {
                                    Spacer()
                                    //Cigaratte Avoided

                                    VStack {
                                        Image("CigAvoided")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        //                    Text("\(cigAvoided)")
                                        Text("0") // <-------------------------------------------- Data Cig Avoided
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .semibold))
                                        Text("Cigarette Avoided")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                    Spacer()
                                    Spacer()
                                    //Money Saved

                                    VStack {
                                        Image("MoneySaved")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        //                    Text("Rp. \(moneySaved)")
                                        Text("Rp 0") // <-------------------------------------------- Data Money Saved
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .semibold))
                                        Text("Money Saved")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    //Smoke Free
                                    VStack {
                                        Image("SmokeFree")
                                            .resizable()
                                            .frame(width: 30, height: 30)
                                            .padding(.vertical, 5)
                                        //                    Text("\(smokeFree)")
                                        Text("0 Days") // <-------------------------------------------- Data Smoke Free
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .semibold))
                                        Text("Smoke Free")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .regular))
                                    }
                                    Spacer()
                                }
                                Rectangle()
                                    .frame(width: 315, height: 2)
                                    .foregroundColor(Color("Primary"))
                                    .cornerRadius(1000)
                                    .padding(.bottom, 10)
                            }
                            .frame(width: 353, height: 1000)
                            .padding()
                            .offset(x: 0, y: -250)
                        }
                    }
                }
                Spacer()
            }
            .ignoresSafeArea()
        }
    }
    
    private func calculateTimeElapsed() -> Int {
        let quitDate = user.onBoarding.setDate
        let components = Calendar.current.dateComponents([.day], from: quitDate, to: Date())
        return components.day ?? 0
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }
}
//        ScrollView {
//            VStack {
//                ZStack {
//                    HStack {
//                        Spacer()
//                            .padding(.horizontal, 150)
//                        VStack {
//                            ZStack {
//                                Circle()
//                                    .frame(width: 400, height: 400)
//                                    .foregroundColor(Color("BlueTint1"))
//                                Circle()
//                                    .frame(width: 275, height: 275)
//                                    .foregroundColor(Color("BlueTint2"))
//                                Circle()
//                                    .frame(width: 150, height: 150)
//                                    .foregroundColor(Color("BlueTint3"))
//                            }
//                            Spacer()
//                                .padding(.vertical, 90)
//                        }
//                    }
//                    Image("PoppyDashboard")
//                        .resizable()
//                        .frame(width: 300, height: 190)
//                        .padding(.top, 52)
//                        .padding(.trailing, 90)
//
//                    ZStack {
//                        Rectangle()
//                            .frame(width: 142, height: 60)
//                            .foregroundColor(Color("White"))
//                            .shadow(radius: 4)
//                            .cornerRadius(15)
//
//                        Circle()
//                            .frame(width: 18, height: 18)
//                            .foregroundColor(Color("Secondary"))
//                            .shadow(radius: 4)
//                            .padding(.top, 60)
//                            .padding(.trailing, 125)
//
//                        Text("Let's start your journey!")
//                            .frame(width: 120)
//                            .foregroundColor(Color("Primary"))
//                            .font(.system(size: 18, weight: .semibold))
//                            .lineLimit(2)
//                    }
//                    .padding(.top, 50)
//                    .padding(.leading, 200)
//                }
//                .frame(width: 393, height: 276)
//                .background(Color("Primary"))
//                .ignoresSafeArea(.all)
//                //            .padding(.bottom, 10)
//
//                HStack {
//                    Spacer()
//                    VStack {
//                        Image("CigAvoided")
//                            .resizable()
//                            .frame(width: 45, height: 45)
//                        //                    Text("\(cigAvoided)")
//                        Text("0")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                        Text("Cig Avoided")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                    }
//                    Spacer()
//                    VStack {
//                        Image("MoneySaved")
//                            .resizable()
//                            .frame(width: 45, height: 45)
//                        //                    Text("Rp. \(moneySaved)")
//                        Text("0")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                        Text("Money Saved")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                    }
//                    Spacer()
//                    VStack {
//                        Image("SmokeFree")
//                            .resizable()
//                            .frame(width: 35, height: 35)
//                            .padding(.vertical, 5)
//                        //                    Text("\(smokeFree)")
//                        Text("0")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                        Text("Smoke Free")
//                            .fontWeight(.semibold)
//                            .foregroundColor(Color("Primary"))
//                    }
//                    Spacer()
//                }
//                Spacer()
//            }
//
//            //        .onAppear() {
//            //            let insightCigsPerDay = user.onBoarding.cigsPerDay
//            //            let insightCigsPerPack = user.onBoarding.cigsPerPack
//            //            let insightPricePerPack = user.onBoarding.pricePerPack
//            //            let insightQuitDate = user.onBoarding.setDate
//            //
//            //            let timeElapsed = calculateTimeElapsed()
//            //
//            //            cigAvoided = Int(insightCigsPerDay * timeElapsed)
//            //            moneySaved = Int(insightPricePerPack * insightCigsPerPack * timeElapsed)
//            //            smokeFree = Int(timeElapsed)
//            //
//            ////            cigAvoided = user.onBoarding.cigsPerDay * smokeFree
//            ////            moneySaved = (user.onBoarding.pricePerPack / user.onBoarding.cigsPerPack) * (user.onBoarding.cigsPerDay * smokeFree)
//            ////            smokeFree = calculateTimeElapsed()
//            //
//            //
//            //        }
//        }
//
//        //    private func calculateTimeElapsed() -> Int {
//        //        let quitDate = user.onBoarding.setDate
//        //        let components = Calendar.current.dateComponents([.day], from: quitDate, to: Date())
//        //        return components.day ?? 0
//        //    }
//        //
//        //    private var dateFormatter: DateFormatter {
//        //        let formatter = DateFormatter()
//        //        formatter.dateStyle = .medium
//        //        return formatter
//        //    }
//    }

//#Preview {
//    DashboardView(user: $user)
//}
