//
//  CBLDatabaseImport.h
//  CouchbaseLite
//
//  Created by Jens Alfke on 6/24/14.
//
//

#import "CBLStatus.h"
@class CBLDatabase;


/** Imports from the v1.0 SQLite database format into a CBLDatabase.
    This class is optional: the source file does not need to be built into the app or the
    Couchbase Lite library. If it's not present, Couchbase Lite will ignore old v1.0 databases
    instead of importing them. */
@interface CBLDatabaseImport : NSObject

- (instancetype) initWithDatabase: (CBLDatabase*)db
                       sqliteFile: (NSString*)sqliteFile;

@property BOOL moveAttachmentsDir;

- (CBLStatus) import;

@property (readonly) NSUInteger numDocs, numRevs;

@end
