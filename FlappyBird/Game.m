//
//  Game.m
//  FlappyBird
//
//  Created by Harshith on 29/09/16.
//  Copyright © 2016 Home. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

- (void)viewDidLoad {
    [super viewDidLoad];
    Tunneltop.hidden = YES;
    Tunnelbottom.hidden = YES;
    bird.hidden = YES;
    exit.hidden = YES;
    score = 0;
    Highscore = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScore"] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)StartGame:(id)sender{
    
    bird.center = CGPointMake(76,254);
    Tunneltop.hidden = NO;
    Tunnelbottom.hidden = NO;
    bird.hidden = NO;
    startgame.hidden = YES;
    scorelabel.text = @"0";
    score = 0;
    exit.hidden = YES;
    BirdMovement = [NSTimer scheduledTimerWithTimeInterval:0.06 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    tunnelmovement = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(tunnelMoving) userInfo:nil repeats:YES];
}

-(void)BirdMoving{
    bird.center = CGPointMake(bird.center.x, bird.center.y - BirdFlight);
    BirdFlight = BirdFlight - 5;
    
    if(BirdFlight < -15)
    {
        BirdFlight = -15;
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    BirdFlight = 20;
}

-(void)tunnelMoving{
    
    Tunneltop.center = CGPointMake(Tunneltop.center.x - 1, Tunneltop.center.y);
    Tunnelbottom.center = CGPointMake(Tunnelbottom.center.x - 1, Tunnelbottom.center.y);
    
    if(Tunneltop.center.x < -28)
    {
        [self PlaceTunnels];
    }
    if(Tunneltop.center.x == 30)
    {
        [self score];
    }
    
    if(CGRectIntersectsRect(bird.frame, Tunneltop.frame)){
        
        [self Gameover];
    }
    
    if(CGRectIntersectsRect(bird.frame, Tunnelbottom.frame)){
        
        [self Gameover];
    }
    
    if(CGRectIntersectsRect(bird.frame, top.frame)){
        
        [self Gameover];
    }

    if(CGRectIntersectsRect(bird.frame, bottom.frame)){
        
        [self Gameover];
    }

    
    
}

-(void)PlaceTunnels{
    randomtoptunnelposition = arc4random() % 350;
    randomtoptunnelposition = randomtoptunnelposition - 228;
    
    randombottomtunnelposition = randomtoptunnelposition + 680;
    Tunneltop.center = CGPointMake(348, randomtoptunnelposition);
    Tunnelbottom.center = CGPointMake(348, randombottomtunnelposition);
}

-(void)score{
    score =score + 1;
    scorelabel.text = [NSString stringWithFormat:@"%i",score];
}

-(void)Gameover{
    if(score > Highscore)
    {
        [[NSUserDefaults standardUserDefaults] setInteger:score forKey:@"HighScore"];
    }
    
    [BirdMovement invalidate];
    [tunnelmovement invalidate];
    exit.hidden = NO;
    Tunneltop.hidden = YES;
    Tunnelbottom.hidden = YES;
    bird.hidden = YES;
    startgame.hidden = NO;
}

@end
