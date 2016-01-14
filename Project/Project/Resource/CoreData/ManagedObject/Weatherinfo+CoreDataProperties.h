//
//  Weatherinfo+CoreDataProperties.h
//  Project
//
//  Created by PFei_He on 16/1/6.
//  Copyright © 2016年 PF-Lib. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Weatherinfo.h"

NS_ASSUME_NONNULL_BEGIN

@interface Weatherinfo (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *radar;
@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSNumber *cityid;
@property (nullable, nonatomic, retain) NSNumber *isRadar;
@property (nullable, nonatomic, retain) NSString *njd;
@property (nullable, nonatomic, retain) NSNumber *qy;
@property (nullable, nonatomic, retain) NSString *sd;
@property (nullable, nonatomic, retain) NSNumber *temp;
@property (nullable, nonatomic, retain) NSString *time;
@property (nullable, nonatomic, retain) NSString *wd;
@property (nullable, nonatomic, retain) NSString *ws;
@property (nullable, nonatomic, retain) NSNumber *wse;

@end

NS_ASSUME_NONNULL_END
