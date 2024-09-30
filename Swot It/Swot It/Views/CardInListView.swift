import SwiftUI

struct CardInListView: View {
    let card: Card
    
    var body: some View {
        HStack(spacing: 8) {
            Text(card.front)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)
            
            DottedLine()
                .frame(width: 1)
                .padding(.vertical, 4)
            
            Text(card.back)
                .font(.subheadline)
                .foregroundColor(.secondary)
                .frame(maxWidth: .infinity, alignment: .leading)
                .layoutPriority(1)
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        )
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 2)
    }
}

struct DottedLine: View {
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 0, y: 0))
                path.addLine(to: CGPoint(x: 0, y: geometry.size.height))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
            .foregroundColor(.gray)
        }
    }
}

// Add this preview struct
struct CardInListView_Previews: PreviewProvider {
    static var previews: some View {
        CardInListView(
            card: Card(
                front: "What is the capital of France?",
                back: "Paris"
            )
        )
        .frame(height: 200)
    }
}
