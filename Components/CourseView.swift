//
//  CourseView.swift
//  CustomTransitions
//
//  Created by Obde Willy on 10/05/23.
//

import SwiftUI

struct CourseView: View {
    var namespace: Namespace.ID
    @Binding var show: Bool
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
            }
            .background(.gray.opacity(0.4))
            .ignoresSafeArea()
            
            Button {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                    show.toggle()
                }
            } label: {
                Image(systemName: "xmark")
                    .font(.body.weight(.bold))
                    .foregroundColor(.secondary)
                    .padding(8)
                    .background(.ultraThinMaterial, in: Circle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
            .padding(20)
            .ignoresSafeArea()
        }
    }
    
    var cover: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .frame(height: 500)
        .foregroundStyle(.pink)
        .background(
            Image("illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.4)
                .matchedGeometryEffect(id: "image", in: namespace)
        )
        .background(
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(30)
                .matchedGeometryEffect(id: "background", in: namespace)
        )
        .mask({
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .matchedGeometryEffect(id: "mask", in: namespace)
        })
        .overlay(content: {
            VStack(alignment: .leading, spacing: 12) {Text("SwiftUI")
                    .font(.largeTitle.weight(.bold))
                    .matchedGeometryEffect(id: "title", in: namespace)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("20 sections - 3 hours".uppercased())
                    .font(.footnote.weight(.semibold))
                    .matchedGeometryEffect(id: "subtitle", in: namespace)
                
                Text("Build an iOS app for iOS 15 with custom layouts, animations and ...")
                    .font(.footnote)
                    .matchedGeometryEffect(id: "text", in: namespace)
                
                Divider()
                
                HStack {
                    Image("avatar")
                        .resizable()
                        .frame(width: 26, height: 26)
                        .cornerRadius(10)
                        .padding(8)
                        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    
                    Text("Taught by Obde Willy")
                }
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .mask({
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                    })
                    .matchedGeometryEffect(id: "blur", in: namespace)
            )
            .offset(y: 250)
            .padding(20)
        })
    }
}

struct CourseView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseView(namespace: namespace, show: .constant(true))
    }
}
