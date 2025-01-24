import SwiftUI

struct HomeView: View {
    @StateObject var homeVM = HomeViewModel.shared
    
    // Array of images to display in the ScrollView
    let images = ["image1", "image2", "image3", "image4"]  // Add your image names here

    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                    Image("color_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                    
                    HStack {
                        Image("location")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 18, height: 18)
                        
                        Text("Vadodara, Gujarat")
                            .font(.custom("YourFontName", size: 13))
                            .foregroundColor(.darkGray)
                    }
                    
                    // Search text field
                    SearchTextField(searchText: .constant(""), placeholder: "Search Products")
                        .frame(width: 360)
                        .padding(.top)
                    
                    Image("banner_top")
                        .resizable()
                        .scaledToFit()
                        .padding(.horizontal)
                    
                    SectionTitleAll(title: "Exclusive Offer"){
                        // code
                    }
                        .padding(.bottom, 10)
                    
                    // Horizontal ScrollView for Images
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {  // Horizontal stack for images
                            ForEach(images, id: \.self) { imageName in
                                Image(imageName)  // Load image by name
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 200) // Set the size of each image
                                    .cornerRadius(10) // Optional: for rounded corners
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 15)
                    
                    // Add your "Exclusive Offer" products or other sections here
                    ScrollView(.horizontal, showsIndicators: false) {
                        LazyHStack(spacing: 15) {
                            ForEach($homeVM.offerArr, id: \.id) { pObj in
//                                ProductCell(pObj: pObj, didAddCart: {
//                                    // Your cart handling here
//                                })
                            }
                        }
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 15)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
