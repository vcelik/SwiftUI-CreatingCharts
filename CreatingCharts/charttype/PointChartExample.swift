//
//  PointChartExample.swift
//  CreatingCharts
//
//  Created by Volkan Celik on 11/08/2023.
//

import SwiftUI
import Charts

struct PointChartExample: View {
    let catData=PetData.catExample
    let dogData=PetData.dogExamples
    
    var data:[(type:String,petData:[PetData])]{
        [(type:"cat",petData:catData),
         (type:"dog",petData:dogData)
        ]
    }
    
    var body: some View {
        Chart{
            ForEach(data,id:\.type){dataSeries in
                ForEach(dataSeries.petData){data in
                    PointMark(x: .value("Year", data.year), y: .value("Population", data.population))
                }
                .foregroundStyle(by: .value("Pet type", dataSeries.type))
                .symbol(by: .value("Pet type", dataSeries.type))
            }

        }
        .chartXScale(domain: 1998...2024)
        .aspectRatio(1, contentMode: .fit)
        .padding()
    }
}

#Preview {
    PointChartExample()
}
