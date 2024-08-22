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
                            .foregroundStyle(.blueShade3)
                            .font(.system(size: 24, weight: .semibold))
                        
                        VStack(spacing: 0) {
                            ForEach(0..<viewModel.daysInMonths[monthIndex], id: \.self) { dayIndex in
                                
                                let date = viewModel.dateFromComponents(monthIndex: monthIndex, dayIndex: dayIndex)
                                let isDateValid = viewModel.isDateValid(date: date!)
                                let isDateAfterSetDate = viewModel.isDateAfterSetDate(date: date!)
                                let containsDate = viewModel.isDateInLog(date: date!)
                                
                                if !containsDate && isDateValid && isDateAfterSetDate{
                                    successLog
                                } else {
                                    if(viewModel.showFailedLog){
                                        failedLog
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
                        }
                        
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
}

extension TrackView{
    var failedLog: some View {
        ZStack {
            Rectangle()
                .frame(width: 19, height: 19)
                .foregroundColor(.clear)
            
            // Circle
            Circle()
                .frame(width: 4, height: 4)
                .foregroundColor(.blueTint2)
        }
    }
    
    var successLog: some View{
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
    }
}

#Preview {
    TrackView()
}
