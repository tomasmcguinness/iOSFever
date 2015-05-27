//
//  SoundViewController.h
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "SpaceSound.h"

@interface SoundViewController : UIViewController

@property (nonatomic, weak) SpaceSound *sound;
@property (nonatomic, strong) AVPlayer *player;
@property (nonatomic, strong) IBOutlet UIButton *playPauseButton;
@property (nonatomic, strong) IBOutlet UITextView *descriptionTextView;

- (IBAction)playButtonClicked:(id)sender;

@end
