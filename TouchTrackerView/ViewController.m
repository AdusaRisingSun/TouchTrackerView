//
//  ViewController.m
//  TouchTrackerView
//
//  Created by Adusa on 15/8/25.
//  Copyright (c) 2015年 Adusa. All rights reserved.
//

#import "ViewController.h"
#import "TouchTracker.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    TouchTracker *tt=[[TouchTracker alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    tt.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:tt];
    // Do any additional setup after loading t;he view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
