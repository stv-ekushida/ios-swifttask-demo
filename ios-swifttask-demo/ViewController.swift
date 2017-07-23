//
//  ViewController.swift
//  ios-swifttask-demo
//
//  Created by Eiji Kushida on 2017/07/23.
//  Copyright © 2017年 Eiji Kushida. All rights reserved.
//

import UIKit
import SwiftTask

class ViewController: UIViewController {

    typealias SampleTask = Task<Void, String, String>

    override func viewDidLoad() {
        super.viewDidLoad()

        //1.タスクを起動
        SampleTask { [weak self] (fulfil, reject) in
            print(1)
            fulfil("OK")

            //2.タスク1を起動
            let task = self?.task1()

            //3. タスク1の結果を受け取る
            task?.then { value , error in

                print(3)

                if let error = error {
                    print("error2:", error)
                    return
                }

                if let value = value {
                    print("value2:",value)
                }
            }

        }.then { (value, error) -> Void in
            //4. タスクの結果を受け取る
            print(4)

            if let error = error {
                print("error1:", error)
                return
            }

            if let value = value {
                print("value1:",value)
            }
        }
    }

    @discardableResult
    func task1() -> SampleTask {
        print(2)

        return SampleTask { (fulfill, reject) in
            reject("Error")
        }
    }
}

