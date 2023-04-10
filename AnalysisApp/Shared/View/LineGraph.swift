//
//  LineGraph.swift
//  AnalysisApp
//
//  Created by Elon on 2022/7/9.
//

import SwiftUI

struct LineGraph: View {
    var data:[CGFloat]
    var body: some View {
        ZStack{
            GeometryReader{proxy in
                ZStack{
                    let height = proxy.size.height
                    let width = (proxy.size.width) / CGFloat(data.count)
                    let maxPoint = data.max() ?? 0 + 100
                    
                    let points = data.enumerated().compactMap { item ->CGPoint in
                        let progress = item.element / maxPoint
                        let pathHeight = progress * height
                        let pathWidth = width * CGFloat(item.offset)
                        
                        return CGPoint(x: pathWidth, y: pathHeight)
                    }
                    // Converting plot as points
                    // Path...
                    Path{path in
                        path.move(to: CGPoint(x: 0, y: 0))
                        path.addLines(points)
                        
                    }
                    .strokedPath(StrokeStyle(lineWidth: 2.5, lineCap: .round, lineJoin: .round))
                }
            }
        }
    }
}

struct LineGraph_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let samplePlot:[CGFloat] = [989,1200,750,790,650,950,1200,600,500,600,890,1203,1400,900,1250,1600,1200]
