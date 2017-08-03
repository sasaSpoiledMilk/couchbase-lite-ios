//
//  Index.swift
//  CouchbaseLite
//
//  Created by Pasin Suriyentrakorn on 8/2/17.
//  Copyright © 2017 Couchbase. All rights reserved.
//

import Foundation

public class Index {
    internal init(name: String?) { }
    
    public var name: String? { return nil; }
    
    public static func index() -> ValueIndex {
        return ValueIndex(name: nil)
    }
    
    public static func index(name: String?) -> ValueIndex {
        return ValueIndex(name: name)
    }
    
    public static func fts() -> FTSIndex {
        return FTSIndex(name: nil)
    }
    
    public static func fts(name: String?) -> FTSIndex {
        return FTSIndex(name: name)
    }
    
    // How to make the subclass implement this method?
    // internal func create(on database: Database) throws {
    //
    // }
}

public class ValueIndex : Index {
    public func on(items: Array<IndexItem>) -> IndexedItems {
        return IndexedItems(name: self.name)
    }
    
    public class IndexedItems : Index {
        
    }
}

public class IndexItem {
    internal let expression: Expression
    internal let isAscending: Bool
    
    internal init(expression: Expression, isAscending: Bool) {
        self.expression = expression
        self.isAscending = isAscending
    }
    
    public static func expression(_ expression:Expression) -> SortOrder {
        return SortOrder(expression: expression, isAscending: true)
    }
    
    public class SortOrder: IndexItem {
        public func ascending() -> IndexItem {
            return IndexItem(expression: self.expression, isAscending: true)
        }
        
        public func descending() -> IndexItem {
            return IndexItem(expression: self.expression, isAscending: false)
        }
    }
}

public class FTSIndex : Index {
    public func on(items: Array<FTSIndexItem>) -> IndexedItems {
        return IndexedItems(name: self.name)
    }
    
    public final class IndexedItems : Index {
        
    }
}

public class FTSIndexItem {
    internal let expression: Expression
    
    internal init(expression: Expression) {
        self.expression = expression
    }
    
    public static func expression(_ expression:Expression) -> FTSIndexItem {
        return FTSIndexItem(expression: expression)
    }
}
