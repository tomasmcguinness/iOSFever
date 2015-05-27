//
//  SpaceSoundsModel.h
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpaceSound.h"

@interface SpaceSoundsModel : NSObject
{
    NSNumber *_count;
    NSArray *_sounds;
}

@property (nonatomic, readonly) NSNumber *numberOfSounds;
@property (nonatomic, readonly) NSArray *sounds;

- (void)loadData:(NSData *)data withError:(NSError **)error;

@end
