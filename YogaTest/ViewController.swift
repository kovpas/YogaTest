//
//  ViewController.swift
//  YogaTest
//
//  Created by Pavel Mazurin on 20/07/2017.
//  Copyright © 2017 kovpas. All rights reserved.
//

import UIKit
import YogaKit

class ViewController: UIViewController {
    let mainView = UIView()
    let view1 = UIView()
    let label = UILabel()
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        mainView.yoga.isEnabled = true
        mainView.backgroundColor = UIColor.init(colorLiteralRed: 123.0/255.0, green: 123.0/255.0, blue: 123.0/255.0, alpha: 1)
        mainView.yoga.width = YGValue(view.bounds.size.width)
        mainView.yoga.height = YGValue(view.bounds.size.height)

        view1.yoga.isEnabled = true
        view1.backgroundColor = #colorLiteral(red: 1, green: 0.6146872722, blue: 0.498338186, alpha: 1)
        view1.yoga.padding = 20

        label.yoga.isEnabled = true
        label.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        label.text = "Label 2"
        label.yoga.height = 50

        button.yoga.isEnabled = true
        button.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        button.yoga.height = 50
        button.setTitle("Add label", for: .normal)
        button.addTarget(self, action: #selector(toggleLabel), for: .touchUpInside)

        mainView.addSubview(view1)
        mainView.addSubview(button)

        view.addSubview(mainView)

        mainView.yoga.applyLayout(preservingOrigin: false)
    }

    @objc func toggleLabel() {
//        view1.yoga.markDirty()
        if label.superview == nil {
            view1.addSubview(label)
            button.setTitle("Remove label", for: .normal)
        } else {
            label.removeFromSuperview()
            button.setTitle("Add label", for: .normal)
        }
        mainView.yoga.applyLayout(preservingOrigin: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

