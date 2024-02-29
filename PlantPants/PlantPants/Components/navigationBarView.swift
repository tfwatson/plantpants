import SwiftUI

struct NavigationBarView: View {
    var title: String
    var notificationAction: () -> Void

    var body: some View {
        HStack {
            // Invisible Spacer on the left to balance the layout
            Color.clear
                .frame(width: 70, height: 44) // This size might need adjustment to match the actual size of your notification button

            Text(title)
                .font(.system(size: 22))
                // Center the text in its frame
                .frame(maxWidth: .infinity, alignment: .center)

            // Invisible Spacer on the right to mimic the space for notification icon
            // Use this even if the notification icon is commented out to maintain symmetry
            Color.clear
                .frame(width: 70, height: 44)
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

