//
//  SoundsTableViewController.h
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpaceSoundsService.h"
#import "SoundViewController.h"

@interface SoundsTableViewController : UITableViewController

@property (nonatomic, strong) SpaceSoundsService *service;
@property (nonatomic, strong) SpaceSoundsModel *model;

@end
