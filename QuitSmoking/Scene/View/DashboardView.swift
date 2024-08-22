//
//  DashboardView.swift
//  QuitSmoking
//
//  Created by PadilKeren on 17/08/24.
//

import SwiftUI

struct DashboardView: View {
    @ObservedObject var viewModel = DashboardViewModel(dashboardUseCase: DashboardUseCase(repository: LocalUserRepository()))
    
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
                                        Text(viewModel.cigaretteAvoided)
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 11, weight: .semibold))
                                        Text("Cigarettes Avoided")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 11, weight: .regular))
                                    }.frame(width: 100, height: 100)
                                    Spacer()
                                    Spacer()
                                    //Money Saved
                                    VStack {
                                        Image("MoneySaved")
                                            .resizable()
                                            .frame(width: 40, height: 40)
                                        //                    Text("Rp. \(moneySaved)")
                                        Text(viewModel.moneySaved)
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .semibold))
                                        Text("Money Saved")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 11, weight: .regular))
                                    }.frame(width: 100, height: 100)

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

                                        Text(viewModel.smokeFree)
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 10, weight: .semibold))
                                        Text("Smoke Free")
                                            .foregroundColor(Color("Primary"))
                                            .font(.system(size: 11, weight: .regular))
                                    }.frame(width: 100, height: 100)
                                    Spacer()
                                }
                                Rectangle()
                                    .frame(width: 315, height: 2)
                                    .background(Color("Primary"))
                                    .offset(CGSize(width: 0.0, height: -15))
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
        }.onAppear{
            print("onappear")
            viewModel.fetch()
        }
    }
}

//#Preview {
//    DashboardView()
//}
