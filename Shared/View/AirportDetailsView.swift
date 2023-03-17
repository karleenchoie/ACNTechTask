//
//  AirportDetailsView.swift
//  ACNTechTask
//
//  Created by Karleen Choie Molinar on 3/17/23.
//

import SwiftUI

struct AirportDetailsView: View {
  
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  let item: AirportModel
  
    var body: some View {
      ZStack {
        VStack(spacing: 10) {
          HStack {
            VStack(alignment: .leading, spacing: 10) {
              Text("Airport Name")
                .bold()
              Text("Country")
                .bold()
              Text("Currency")
                .bold()
              Text("Timezone")
                .bold()
              Text("Location (Latitude Direction)")
                .bold()
              Text("Location (Longitude Direction)")
                .bold()
            }
            
            VStack(alignment: .leading, spacing: 10) {
              Text("\(item.airportName ?? "-")")
                .italic()
              Text("\(item.country?.countryName ?? "-")")
                .italic()
              Text("\(item.country?.countryName ?? "-")")
                .italic()
              Text("\(item.city?.timeZoneName ?? "-")")
                .italic()
              Text("\(item.location?.latitudeDirection ?? "-")")
                .italic()
              Text("\(item.location?.longitudeDirection ?? "-")")
                .italic()
            }
          }
          
          Button(action: {
            self.presentationMode.wrappedValue.dismiss()
          }) {
            HStack(alignment: .center, spacing: 10.0) {
              Text("Go back")
            }
            .padding()
            .background(Color.gray.opacity(0.1), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
          }
        }.frame(maxHeight: .infinity)
      }
    }
}

//struct AirportDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        AirportDetailsView()
//    }
//}
