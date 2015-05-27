//
//  SoundsService.h
//  Blackswan
//
//  Created by Tomas McGuinness on 27/05/2015.
//  Copyright (c) 2015 Cold Bear Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
#import "SpaceSoundsModel.h"

@interface SpaceSoundsService : NSObject

- (void)fetchSounds:(void(^)(SpaceSoundsModel *model, NSError *error))callback;

@end
