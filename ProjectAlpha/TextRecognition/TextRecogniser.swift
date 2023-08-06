//  TextRecogniser.swift
//  TestVision
//
//  Created by Benjamin Alexander on 05/08/2023.
//

import Foundation
import Vision
import VisionKit

final class TextRecogniser {
    let cameraScan: VNDocumentCameraScan
    
    init(cameraScan: VNDocumentCameraScan) {
        // take in the document scan and make a class attribute
        self.cameraScan = cameraScan
    }
    
    // create the dispatch queue. label is for debugging perposes. qos. autorelease basically removes an item from the queue once it has been processed. no attributes need to be passed
    private let queue = DispatchQueue(label: "scan-text",
                                      qos: .default,
                                      attributes: [],
                                      autoreleaseFrequency: .workItem)
    
    // function to do the text recognition
    func recogniseText(withCompletionHandler completionHandler: @escaping ([String]?) -> Void) {
        // create a queue of images
        queue.async {
            // take the image from the current page from the scans
            let image = (0..<self.cameraScan.pageCount).compactMap({
                // and convert to a cgImage
                self.cameraScan.imageOfPage(at: $0).cgImage
            })
            // map each image to an image with an attached recognize text request
            let imagesAndRequests = image.map({(image: $0, request: VNRecognizeTextRequest())})
            
            // map the images and requests previously to a string of the text on the document
            let textPerPage = imagesAndRequests.map{image,request->String in
                // create the image request handler passing in the image
                let handler = VNImageRequestHandler(cgImage: image, options: [:])
                do {
                    // perform the recognise text request
                    try handler.perform([request])
                    // request the results. guard is a 1 line try except block
                    guard let observations = request.results else {return ""}
                    // do some filtering on the observations (compact map filters nil values)
                    return observations.compactMap({$0
                        // take the 1st top candidates from the vnrecognisetextrequest for each word. this can be changed later to use the top 2 or 3 in case the top 1 word is incorrect
                        .topCandidates(1)
                        // optional first takes only the first returned value from the request as a failsafe incase multiple are returned
                        .first?
                        // convert to string
                        .string})
                        // connect each line with a new line
                        .joined(separator: "\n")
                }
                catch {
                    print(error)
                    return ""
                }
            }
            // run the queue
            DispatchQueue.main.async {
                completionHandler(textPerPage)
            }
        }
    }
}

