//
//  ImageWand+Sequence.swift
//  file-sync-services
//
//  Created by Andrew J Wagner on 8/5/17.
//
//

import Foundation

#if os(Linux)
    import CMagickWandLinux
#else
    import CMagickWandOSX
#endif

extension ImageWand {
    public var numberOfImages: Int {
        return MagickGetNumberImages(self.pointer)
    }

    public func setImageIndex(_ index: Int) {
        MagickSetIteratorIndex(self.pointer, index)
    }
}
