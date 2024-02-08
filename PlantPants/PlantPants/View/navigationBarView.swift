import SwiftUI

struct NavigationBarView: View {
    var title: String
    var notificationAction: () -> Void

    var body: some View {
        HStack {
            // Invisible Spacer that matches the size of the notification icon
            Color.clear
                .frame(width: 70, height: 44) // Adjust size to match your notification icon size

            Spacer()
            
            Text(title)
                .font(.headline)
                .frame(alignment: .center)

            Spacer()

            // Notification Icon Button
            Button(action: notificationAction) {
                Image(systemName: "bell.fill")
                    .imageScale(.large)
                    .padding()
            }
        }
        .padding(.vertical, 5)
        .background(Color.white)
    }
}

// Preview
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView(title: "PLANTPANTS", notificationAction: {
            print("Notification Icon Tapped")
        })
    }
}
