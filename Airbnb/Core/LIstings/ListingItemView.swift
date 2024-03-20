import SwiftUI

struct ListingItemView: View{
    
    var body: some View{
        VStack(spacing: 8){
            //image
            ListingImageCorouselView()
                .frame(height: 320)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            //listing details
            HStack(alignment: .top){
                // deatils
                VStack(alignment: .leading){
                    Text("Miami, Florida")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Text("12 mi away")
                        .foregroundStyle(.gray)
                    Text("Nov 3 - 10")
                        .foregroundStyle(.gray)
                    HStack(spacing: 4) {
                        Text("$100")
                            .fontWeight(.semibold)
                            .foregroundColor(.black)
                        Text("night")
                            .foregroundColor(.black)
                    }
                }
                Spacer()
                // rating
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundColor(.black)
                    Text("4.86")
                        .foregroundColor(.black)
                }
            }
            .font(.footnote)
        }
    }
}

#Preview{
    ListingItemView()
}
