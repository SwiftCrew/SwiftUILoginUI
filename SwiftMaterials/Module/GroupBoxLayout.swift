//
//  GroupBoxLayout.swift
//  SwiftMaterials
//
//  Created by Mohd Tahir on 20/07/24.
//

import SwiftUI

struct MusicPlayerViewLayout: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundStyle(.pink.gradient.opacity(0.8))
                .ignoresSafeArea()
            VStack {
                GroupBox {
                    GroupBox {
                        MusicPlayerView()
                    }
                } label: {
                    Label("Now Playing", systemImage: "music.note")
                }
                .groupBoxStyle(.music)
            }
            .padding()
        }
    }
}

#Preview {
    MusicPlayerViewLayout()
}

struct MusicGroupBoxStyle: GroupBoxStyle {

    func makeBody(configuration: Configuration) -> some View {
        VStack(alignment: .leading) {
            configuration.label
                .bold()
                .foregroundStyle(.pink)
            configuration.content
        }
        .padding()
        .background(.regularMaterial, in: RoundedRectangle(cornerRadius: 12))
    }
}

extension GroupBoxStyle where Self == MusicGroupBoxStyle {
    static var music: MusicGroupBoxStyle { .init() }
}

struct MusicPlayerView: View {

    var body: some View {
        VStack {
            HStack {
                RoundedRectangle(cornerRadius: 8)
                    .frame(width: 50, height: 50)
                    .foregroundStyle(Color.secondary)

                VStack(alignment: .leading, spacing: 2) {
                    Text("Cool Song Title")
                        .font(.headline.bold())

                    Text("Artist Name")
                        .font(.footnote)
                        .foregroundStyle(Color.secondary)
                }
                Spacer()
            }
            .padding(.bottom, 8)

            ProgressView(value: 0.4, total: 1)
                .tint(.secondary)
                .padding(.bottom, 20)

            HStack {

                Button(action: {

                }, label: {
                    Image(systemName: "backward.fill")
                        .foregroundStyle(Color.secondary)
                })

                Button(action: {

                }, label: {
                    Image(systemName: "pause.fill")
                        .foregroundStyle(Color.secondary)
                })

                Button(action: {

                }, label: {
                    Image(systemName: "forward.fill")
                        .foregroundStyle(Color.secondary)
                })
            }
        }
    }
}
