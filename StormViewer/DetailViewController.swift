//
//  DetailViewController.swift
//  Social Media
//
//  Created by Y K on 11.07.2023.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var selectedImage: String?
    
    var selectedPictureNumber = 0 // extra task
    var totalPictures = 0 // extra task
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action,
                                                            target: self,
                                                            action: #selector(shareTapped))

        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    
    @objc func shareTapped() {   // magical piece of code, sheeesh
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8),
        let imageName = selectedImage else {
            print("No image found")
            return
        }
        
        let imageItem = UIImage(data: image)
        let textItem = "Check out this image: \(imageName)"
        
        let activityItems: [Any] = [imageItem ?? "Unknown" as Any, textItem]
        
        
        let vc = UIActivityViewController(activityItems: activityItems, applicationActivities: [])
        
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
