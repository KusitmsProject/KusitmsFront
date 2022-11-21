//
//  PostImage.swift
//  Bring
//
//  Created by 오예진 on 2022/11/21.
//

import Alamofire
extension UIImage {
    func resize(newWidth: CGFloat) -> UIImage {
        let scale = newWidth / self.size.width
        let newHeight = self.size.height * scale

        let size = CGSize(width: newWidth, height: newHeight)
        let render = UIGraphicsImageRenderer(size: size)
        let renderImage = render.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
        
        print("화면 배율: \(UIScreen.main.scale)") // 배수
        print("origin: \(self), resize: \(renderImage)")
        return renderImage
    }
}
func postImage(inputImage: UIImage!) {
    let url = "http://3.34.31.255:8081/bring/uploadImage"
    let resizedImg = inputImage.resize(newWidth: 256)
    AF.upload(multipartFormData: { multipartFormData in
        multipartFormData.append(Data("one".utf8), withName: "one")
        multipartFormData.append(Data("two".utf8), withName: "two")
        multipartFormData.append( resizedImg.jpegData(compressionQuality: 1)!, withName: "image",fileName:"image.jpeg",mimeType: "image/jpeg")
    }, to: url)
    .responseDecodable(of: Img.self ) { response in
        print("Response DecodableType: \(response.value!.imageUrls)")
    }
}
