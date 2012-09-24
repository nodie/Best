//
//  YUViewController.m
//  Best
//
//  Created by 於 琦峰 on 12-09-22.
//  Copyright (c) 2012年 於 琦峰. All rights reserved.
//

#import "YUViewController.h"

@interface YUViewController ()

@end

@implementation YUViewController

@synthesize lblinfo = _lblinfo;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_lblinfo release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setLblinfo:nil];
    [super viewDidUnload];
}
@end
