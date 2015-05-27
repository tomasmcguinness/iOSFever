//
//  SoundViewController.m
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import "SoundViewController.h"

@interface SoundViewController ()

@end

@implementation SoundViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = self.sound.title;
    
    if(self.sound.desc)
    {
        self.descriptionTextView.text = self.sound.desc;
    }
    else
    {
        self.descriptionTextView.text = @"No description available";
    }
    
    // GUTTED! Didn't realise SoundCloud authentication was required at this point.
    //
    self.player = [AVPlayer playerWithURL:[NSURL URLWithString:self.sound.streamUrl]];
}

- (IBAction)playButtonClicked:(id)sender
{
    if([self.player rate] != 0.0)
    {
        [self.playPauseButton setImage:[UIImage imageNamed:@"glyphicons_173_play"] forState:UIControlStateNormal];
        [self.player pause];
    }
    else
    {
        [self.playPauseButton setImage:[UIImage imageNamed:@"glyphicons_174_pause"] forState:UIControlStateNormal];
        [self.player play];
    }
}

@end
