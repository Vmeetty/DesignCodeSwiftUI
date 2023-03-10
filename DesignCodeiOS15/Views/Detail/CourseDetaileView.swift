//
//  CourseDetaoleView.swift
//  DesignCodeiOS15
//
//  Created by admin on 2/6/23.
//

import SwiftUI

struct CourseDetaileView: View {
    var namespace: Namespace.ID
    @Binding var course: Course
    @Binding var show: Bool
    @State var appear = [false, false, false]
    @EnvironmentObject var model: Model
    @State var viewState: CGSize = .zero
    @State var isDragble = true
    @State var selectedSection = courseSections[0]
    @State var showSection = false
    
    var body: some View {
        ZStack {
            ScrollView {
                cover
                    .frame(height: 500)
                
                content
                    .offset(y: 120)
                    .padding(.bottom, 200)
                    .opacity(appear[2] ? 1 : 0)
            }
            .coordinateSpace(name: "scroll")
            .background(Color("Background"))
            .mask({
                RoundedRectangle(cornerRadius: viewState.width / 3, style: .continuous)
            })
            .shadow(color: .black.opacity(0.3), radius: 30, x: 0, y: 10)
            .scaleEffect(viewState.width / -500 + 1)
            .background(.black.opacity(viewState.width / 500))
            .background(.ultraThinMaterial)
            .gesture(isDragble ? drag : nil)
            .ignoresSafeArea()
            
            closeButton
        }
        .onAppear {
            userInfofadeIn()
        }
    }
    
    var cover: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .named("scroll")).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 500 + scrollY : 500)
            .foregroundColor(.black)
            .background(
                Image(course.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "image\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? scrollY * -0.8 : scrollY / 5)
            )
            .background(
                Image(course.background)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "background\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? scrollY / 1000 + 1 : 1)
                    .blur(radius: scrollY / 10)
            )
            .mask {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .matchedGeometryEffect(id: "mask\(course.id)", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            }
            .overlay(content: {
                overlayContent
                    .offset(y: scrollY > 0 ? scrollY * -0.4 : 0)
            })
        }
    }
    
    var closeButton: some View {
        Button {
            withAnimation(.closeCard) {
                show.toggle()
                model.showDetail = false
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
    
    var content: some View {
        VStack(alignment: .leading) {
            ForEach(Array(courseSections.enumerated()), id: \.offset) { index, section in
                if index != 0 { Divider() }
                SectionRow(section: section)
                    .onTapGesture {
                        selectedSection = section
                        showSection = true
                    }
            }
        }
        .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 30, style: .continuous))
        .strokeStyle(cornerRadius: 30)
        .padding(20)
        .sheet(isPresented: $showSection) {
            SectionView(section: $selectedSection)
        }
    }
    
    var overlayContent: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(course.title)
                .font(.largeTitle.weight(.bold))
                .matchedGeometryEffect(id: "title\(course.id)", in: namespace)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(course.subtitle.uppercased())
                .font(.footnote.weight(.semibold))
                .matchedGeometryEffect(id: "subtitle\(course.id)", in: namespace)
            Text(course.text)
                .font(.footnote)
                .matchedGeometryEffect(id: "text\(course.id)", in: namespace)
            Divider()
                .opacity(appear[0] ? 1 : 0)
                .matchedGeometryEffect(id: "divider\(course.id)", in: namespace)
            HStack {
                Image("Avatar Default")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .cornerRadius(10)
                    .padding(8)
                    .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 18, style: .continuous))
                    .strokeStyle(cornerRadius: 18)
                Text("Vlad Chuvashov")
                    .font(.footnote)
            }
            .opacity(appear[1] ? 1 : 0)
            .matchedGeometryEffect(id: "nameAndAvatar\(course.id)", in: namespace)
        }
        .padding(20)
        .background(
            Rectangle()
                .fill(.ultraThinMaterial)
                .mask({
                    RoundedRectangle(cornerRadius: 30, style: .continuous)
                })
                .matchedGeometryEffect(id: "blur\(course.id)", in: namespace)
        )
        .offset(y: 250)
        .padding(20)
    }
    
    var drag: some Gesture {
        DragGesture()
            .onChanged({ newValue in
                guard newValue.translation.width > 0 else { return }
                viewState = newValue.translation
            })
            .onEnded({ newValue in
                if viewState.width > 80 {
                    close()
                } else {
                    withAnimation(.closeCard) {
                        viewState = .zero
                    }
                }
            })
    }
    
    private func close() {
        withAnimation(.closeCard.delay(0.1)) {
            show.toggle()
            model.showDetail = false
        }
        withAnimation(.closeCard) {
            viewState = .zero
        }
        
        isDragble = false
    }
    
    private func userInfofadeIn() {
        withAnimation(.easeOut.delay(0.3)) {
            appear[0] = true
        }
        withAnimation(.easeOut.delay(0.4)) {
            appear[1] = true
        }
        withAnimation(.easeOut.delay(0.5)) {
            appear[2] = true
        }
    }
    
    private func fadeOut() {
        appear[0] = false
        appear[1] = false
        appear[2] = true
    }
}

struct CourseDetaoleView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        CourseDetaileView(namespace: namespace, course: .constant(courses[0]), show: .constant(true))
            .environmentObject(Model())
    }
}
