//
//  AirportView.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import SwiftUI

struct AirportView: View{
  
  @StateObject var viewModel = AirportViewModel(httpClient: HttpClient())
    
    var body: some View{
      NavigationView {
        ZStack {
          if viewModel.isRefreshing {
            ProgressView()
          } else {
            List{
              ForEach(viewModel.airports, id: \.self){ item in
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
      .onAppear {
          Task {
              do {
                try await viewModel.fetchAirport()
              } catch {
                  print("❌ Error: \(error)")
              }
          }
      }
      .navigationBarHidden(true)
    }
}
struct AirportView_Previews: PreviewProvider {
    static var previews: some View {
        AirportView()
    }
}
