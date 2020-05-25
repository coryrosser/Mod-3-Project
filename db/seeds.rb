require 'faker'
Trade.destroy_all
LineItem.destroy_all
Profile.destroy_all
Item.destroy_all
User.destroy_all
#User Create 

User.create(first_name: 'Joey', last_name: 'P', email: 'jp@jp.com', password: 'test', location: "Georgia")
User.create(first_name: 'Cory', last_name: 'R', email: 'cr@cr.com', password: 'test', location: "Georgia")

10.times {
    User.create(
        first_name: Faker::Name.unique.first_name,
        last_name: Faker::Name.unique.last_name,
        email: Faker::Internet.email,
        password: "test",
        location: Faker::Address.state,
    )
}

#item create 
FENDER_MODELS = [
    "Fender AG Series",
    "Fender Avalon",
    "Fender Balboa",
    "Fender California Series",
    "Fender Concert",
    "Fender Concord",
    "Fender Del Mar",
    "Fender DG Series",
    "Fender Ensanada Series",
    "Fender F Series",
    "Fender Folk",
    "Fender Duo-Sonic",
    "Fender Jaguar",
    "Fender Jazzmaster",
    "Fender Meteora",
    "Fender Mustang",
    "Fender Sixty-Six",
    "Fender Stratocaster",
    "Fender Telecaster",
    "Fender Powercaster",
]
TAYLOR_MODELS = [
    "412ce",
    "412ce-R",
    "414ce-R",
    "414ce",
    "914ce",
    "GS Mini-e Koa",
    "224ce-K DLX",
    "K24ce",
    "Big Baby Taylor",
    "PS14ce Blackwood - Sinker Redwood",
    "Builder's Edition K24ce",
    "914ce",
]
FENDER_MODELS.map{|model| 
    Item.create(
        brand: "Fender", 
        model: model, 
        description: "placeholder",
        condition: (1 + rand(5)),
        retail_value: (1 + rand(5)),
        finish: "placeholder",
        trade_rating: 0 ,
        user_id: User.all.sample.id,
    )
}

TAYLOR_MODELS.map{|model| 
    Item.create(
        brand: "Taylor", 
        model: model, 
        description: "placeholder",
        condition: (1 + rand(5)),
        retail_value: (1 + rand(5)),
        finish: "placeholder",
        trade_rating: 0 ,
        user_id: User.all.sample.id,
    )
}

Item.all.map{|item| item.update(trade_rating: item.calculate_trade_rating)}

# Trade Create need to convert trader_id and trainee_id
