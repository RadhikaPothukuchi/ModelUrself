//
//  ViewController.swift
//  ModelUrself
//
//  Created by Radhika Pothukuchi on 7/4/18.
//  Copyright © 2018 Radhika Pothukuchi. All rights reserved.
//

import UIKit
import AVFoundation

enum SelectedButtonTag: Int {
    case Selfie = 1
    case Product = 2
    
}

class ModelUrselfViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var selfieImageView: UIImageView!
    @IBOutlet weak var modelUrselfButton: UIButton!
    @IBOutlet weak var tryMeButton: UIButton!
    @IBOutlet weak var productImageView: UIImageView!
    
    var imagePickerController = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickerController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func showOptionsForPhotos(_ sender: UIButton) {
        //TODO:check for sender
        //show action sheet
        print(sender.tag)
        
        let uiAlertViewController = UIAlertController(title: nil, message: "Choose your photo source", preferredStyle: .actionSheet)
        //TODO: Display camera action only if device is capable and as well user has given access.
        //TODO: if access is not given request for access.
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default , handler: {  [weak self] _ in
            self?.imagePickerController.allowsEditing = true
            self?.imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
            //TODO: any other properties related to camera.
            self?.imagePickerController.showsCameraControls = true
            //self?.imagePickerController.takePicture()
            //TODO: handle !
            self?.present((self?.imagePickerController)!, animated: true, completion: {
                
            })
        })
        let photosAction = UIAlertAction(title: "Photo Library", style: .default, handler: {  [weak self] _ in

            self?.imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
            //TODO: handle !
            self?.present((self?.imagePickerController)!, animated: true, completion:{
                
            })
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            uiAlertViewController.addAction(cameraAction)
        }
        uiAlertViewController.addAction(photosAction)
        uiAlertViewController.addAction(cancelAction)
        self.present(uiAlertViewController, animated: true, completion: nil)
        
        
        //TODO: upon selection it should put the image the right image box.
        
        
    }
}

extension ModelUrselfViewController : UIImagePickerControllerDelegate {
    
  
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        print("touched: \(String(describing: touch?.location(in: self.view).x)) , \(String(describing:touch?.location(in: self.view).y))" )
    }
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            self.productImageView.image = image
        }
        self.imagePickerController.dismiss(animated: true, completion: nil)
    }
    
    
}

