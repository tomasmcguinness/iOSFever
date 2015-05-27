//
//  SpaceSoundModel.h
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpaceSound : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *streamUrl;
@property (nonatomic, strong) NSNumber *duration;

@end
