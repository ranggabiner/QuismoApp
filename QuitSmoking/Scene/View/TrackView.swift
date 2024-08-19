//
//  TrackView.swift
//  QuitSmoking
//
//  Created by Michael Chrisandy on 19/08/24.
//

import SwiftUI

struct TrackView: View {
    @StateObject var viewModel = TrackViewModel(cigaretteLogUseCase: CigaretteLogUseCase(repository: LocalUserRepository()))
    
    var body: some View {
        VStack{
            HStack(alignment: .top, spacing: 8) {
                ForEach((0..<12), id: \.self) { monthIndex in
                    VStack {
                        Text("\(viewModel.months[monthIndex])")
                            .font(.headline)
                            .padding(.bottom, 4)
                        
                        VStack(spacing: 0) {
                            ForEach(0..<viewModel.daysInMonths[monthIndex], id: \.self) { dayIndex in
                                
                                let date = DateComponents(calendar: Calendar.current, year: 2024, month: 1 + monthIndex, day: 1 + dayIndex).date
                                
                                let dateToCheck = Calendar.current.dateComponents([.year, .month, .day], from: date ?? Date())
                                let logDates = viewModel.cigaretteLog?.cigarettesSmoked ?? []
                                
                                let containsDate = logDates.contains { logDate in
                                    let logDateComponents = Calendar.current.dateComponents([.year, .month, .day], from: logDate)
                                    return logDateComponents == dateToCheck
                                }
                                
                                if containsDate {
                                    
                                    ZStack {
                                        // Container
                                        Rectangle()
                                            .frame(width: 19, height: 19)
                                            .foregroundColor(.clear)
                                        
                                        // Circle
                                        Image("TrackImage")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 19, height: 19)
                                    }
                                    
                                    
                                } else {
                                    if(viewModel.showFailedLog){
                                        ZStack {
                                            Rectangle()
                                                .frame(width: 19, height: 19)
                                                .foregroundColor(.clear)
                                            
                                            // Circle
                                            Circle()
                                                .frame(width: 4, height: 4)
                                                .foregroundColor(.blue)
                                        }
                                        
                                    }
                                }
                                
                            }
                            
                            //biar ga nyusut
                            ZStack {
                                // Container
                                Rectangle()
                                    .frame(width: 19, height: 19)
                                    .foregroundColor(.clear)
                            }
                        }.padding(.top)
                        
                    }
                }
            }
            .padding()
            
            Spacer()
        }
        .onAppear{
            viewModel.fetch()
        }
        .onTapGesture {
            viewModel.showFailedLog.toggle()
        }
    }
    
    func tapped(){
        print("x")
        print(viewModel.cigaretteLog?.cigarettesSmoked)
    }
}

#Preview {
    TrackView()
}
