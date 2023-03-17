//
//  AirportView.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import SwiftUI

struct AirportView: View{
    @StateObject var list = AirportViewModel()
    
    var body: some View{
      NavigationView {
        ZStack {
          if list.isRefreshing {
            ProgressView()
          } else {
            List{
              ForEach(list.datas, id: \.self){ item in
                NavigationLink(destination: AirportDetailsView(item: item)){
                  VStack(alignment: .leading) {
                      Text("**Airport Name**: \(item.airportName ?? "")")
                      Text("**Country**: \(item.country?.countryName ?? "")")
                  }
                  .frame(
                    maxWidth: .infinity,
                    alignment: .leading
                  )
                  .padding()
                }
              }
            }
            .listStyle(.plain)
          }
        }
      }
      .onAppear(perform: list.fetchAirport)
      .navigationBarHidden(true)
    }
}
struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView()
    }
}
