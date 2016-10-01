//
//  Game.h
//  FlappyBird
//
//  Created by Harshith on 29/09/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;
int randomtoptunnelposition;
int randombottomtunnelposition;
int score;
NSInteger Highscore;


@interface Game : UIViewController
{
    IBOutlet UILabel *scorelabel;
    IBOutlet UIButton *startgame;
    IBOutlet UIButton *exit;
    IBOutlet UIImageView *bird;
    IBOutlet UIImageView *Tunneltop;
    IBOutlet UIImageView *Tunnelbottom;
    IBOutlet UIImageView *top;
    IBOutlet UIImageView *bottom;
    
    
    
    NSTimer *BirdMovement;
    NSTimer *tunnelmovement;
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event;
-(void)tunnelMoving;
-(void)PlaceTunnels;
-(void)score;
-(void)Gameover;
@end
