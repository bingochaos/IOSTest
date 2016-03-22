//
//  ViewController.m
//  autolayout
//
//  Created by 黄斌超 on 10/27/15.
//  Copyright © 2015 bingoc. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *leftView;
@property (weak, nonatomic) IBOutlet UIView *rightView;
@property (weak, nonatomic) IBOutlet UIView *downView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillLayoutSubviews{
    if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
        CGRect rect = self.leftView.frame;
        rect.size.width = 254;
        rect.size.height = 130;
        self.leftView.frame = rect;

        rect = self.rightView.frame;
        rect.origin.x =294;
        rect.size.width = 254;
        rect.size.height = 130;
        self.rightView.frame = rect;

        rect = self.downView.frame;
        rect.origin.y = 170;
        rect.size.width = 528;
        rect.size.height = 130;
        self.downView.frame = rect;

    }
    else{
        CGRect rect = self.leftView.frame;
        rect.size.width = 130;
        rect.size.height = 254;
        self.leftView.frame = rect;

        rect = self.rightView.frame;
        rect.origin.x = 170;
        rect.size.width = 130;
        rect.size.height = 254;
        self.rightView.frame = rect;

        rect = self.downView.frame;
        rect.origin.y = 295;
        rect.size.width = 280;
        rect.size.height = 254;
        self.downView.frame = rect;
    }
}
@end
