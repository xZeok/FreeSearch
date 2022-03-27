//
//  MockData.swift
//  FreeSearch
//
//  Created by Jaime Capponi Zerene on 27-03-22.
//

import Foundation

extension Item {
    static func mock() -> Item {
        return Item(id: "MLC926359567",
                    title: "Nintendo Switch 32gb Standard Color Rojo Neón, Azul Neón Y Negro",
                    price: 334990,
                    availableQuantity: 64,
                    currencyId: "CLP",
                    permalink: URL(string: "https://www.mercadolibre.cl/nintendo-switch-32gb-standard-color-rojo-neon-azul-neon-y-negro/p/MLC8755483")!,
                    thumbnail: "https://www.hites.com/dw/image/v2/BDPN_PRD/on/demandware.static/-/Sites-mastercatalog_HITES/default/dwfd645ee4/images/original/pim/821637001/821637001_2.jpg?sw=1000&sh=1000")
    }
    
    static func mockItems() -> [Item] {
        return [mock(), mock()]
    }
}
