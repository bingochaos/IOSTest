//
//  DetailViewController.h
//  ipadapp
//
//  Created by 黄斌超 on 10/23/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

