//
//  ViewController.m
//  FlappyBird
//
//  Created by Harshith on 29/09/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    HighScore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"];
    highScore.text = [NSString stringWithFormat:@"High Score %li",(long)HighScore];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}    

@end
