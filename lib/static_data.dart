import 'package:flutter/material.dart';

import 'models/category.dart';

const categoryTitleData = [
  'All',
  'Electronics',
  'Premium',
  'Kids',
  'Gifting',
  'Beauty',
];

const categoryIconData = [
  Icons.shopping_basket_outlined,
  Icons.headphones_outlined,
  Icons.diamond_outlined,
  Icons.child_friendly_outlined,
  Icons.wallet_giftcard_outlined,
  Icons.brush_outlined,
];

const chatData = [
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Hey! How's your day going?",
    "msg_timestamp": "2025-02-18T10:00:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Hey John! It's been great. Just got back from the gym.",
    "msg_timestamp": "2025-02-18T10:01:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Nice! Feeling energized?",
    "msg_timestamp": "2025-02-18T10:02:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Yeah, but also super hungry now!",
    "msg_timestamp": "2025-02-18T10:03:45Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Haha, what’s for lunch?",
    "msg_timestamp": "2025-02-18T10:05:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Thinking of making a sandwich. You?",
    "msg_timestamp": "2025-02-18T10:06:10Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Probably ordering a burger. Feeling lazy!",
    "msg_timestamp": "2025-02-18T10:07:25Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Haha, must be a chill day then?",
    "msg_timestamp": "2025-02-18T10:08:40Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Yep! Watching some Netflix too.",
    "msg_timestamp": "2025-02-18T10:10:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "What are you watching?",
    "msg_timestamp": "2025-02-18T10:11:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Stranger Things, finally catching up!",
    "msg_timestamp": "2025-02-18T10:12:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Omg, it’s so good! Which episode?",
    "msg_timestamp": "2025-02-18T10:13:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Season 3, Episode 5!",
    "msg_timestamp": "2025-02-18T10:15:05Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Oh, things are about to get intense!",
    "msg_timestamp": "2025-02-18T10:16:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "No spoilers please! Haha.",
    "msg_timestamp": "2025-02-18T10:17:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Haha, I promise! Enjoy it!",
    "msg_timestamp": "2025-02-18T10:18:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Thanks! What are you up to later?",
    "msg_timestamp": "2025-02-18T10:20:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Maybe going out for coffee with a friend.",
    "msg_timestamp": "2025-02-18T10:21:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Sounds nice! Which place?",
    "msg_timestamp": "2025-02-18T10:22:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Probably the new cafe downtown!",
    "msg_timestamp": "2025-02-18T10:23:45Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Oh, I heard it's great! Let me know how it is.",
    "msg_timestamp": "2025-02-18T10:25:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Will do!",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "For the record, I love Italian food.",
    "msg_timestamp": "2025-02-18T10:10:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Me too! Especially pasta.",
    "msg_timestamp": "2025-02-18T10:11:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Same! What's your favorite type?",
    "msg_timestamp": "2025-02-18T10:12:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "I love carbonara. You?",
    "msg_timestamp": "2025-02-18T10:13:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Alfredo for me!",
    "msg_timestamp": "2025-02-18T10:15:05Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Good choice! We should grab pasta sometime.",
    "msg_timestamp": "2025-02-18T10:16:20Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Definitely! Let’s plan soon.",
    "msg_timestamp": "2025-02-18T10:17:35Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Sure! I'll let you know when I'm free.",
    "msg_timestamp": "2025-02-18T10:18:50Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Sounds good!",
    "msg_timestamp": "2025-02-18T10:20:00Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Catch up later?",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "For sure! Have fun!",
    "msg_timestamp": "2025-02-18T10:27:30Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/thumb/women/12.jpg",
    "name": "Emily Smith",
    "msg_text": "Thanks! Bye.",
    "msg_timestamp": "2025-02-18T10:26:15Z"
  },
  {
    "profile_pic_url": "https://randomuser.me/api/portraits/men/1.jpg",
    "name": "John Doe",
    "msg_text": "Bbye!",
    "msg_timestamp": "2025-02-18T10:27:30Z"
  },
];

const homeData = [
  CategoryDm(
    id: "101",
    name: "Grocery & Kitchen",
    subcategories: [
      SubcategoryDm(
        name: "Vegetables & Fruits",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Vegetables_&_Fruits_Fabicon_1724952276736",
      ),
      SubcategoryDm(
        name: "Atta, Rice & Dal",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_atta,_rice_&_dal_1701251225824",
      ),
      SubcategoryDm(
        name: "Oil, Ghee & Masala",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Oil,ghee&masala_1706701916836",
      ),
      SubcategoryDm(
        name: "Dairy, Bread & Eggs",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Dairy_&_bread_&_eggs_1716274960281",
      ),
      SubcategoryDm(
        name: "Bakery & Biscuits",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Bakery_&_Biscuits_1708337109248",
      ),
      SubcategoryDm(
        name: "Dry Fruits & Cereals",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Dry_fruits_&_Cereals_Fabicon_1727547639034",
      ),
      SubcategoryDm(
        name: "Kitchenware & Appliances",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Kitchen_Utensils_&_1701253042884",
      ),
      SubcategoryDm(
        name: "Sauces & Spreads",
        // name: "Herbs & Seasoning",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_sauces_&_spreads_(1)_1708404292298",
      ),
    ],
  ),
  CategoryDm(
    id: "103",
    name: "Snacks & Drinks",
    subcategories: [
      SubcategoryDm(
        name: "Chips & Namkeen",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Chips_&_namkeen_1701251290984",
        // "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/1237_1670927167688.png",
      ),
      SubcategoryDm(
        name: "Fresheners & Paan Corner",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_paan_corner_1701251755370",
      ),
      SubcategoryDm(
        name: "Chocolates & Sweets",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Sweets_&_chocolates_1701251350378",
        // "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/9_1693202755712.png",
      ),
      SubcategoryDm(
        name: "Drinks & Juices",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Drinks_&_Juices_copy_Fab_(1)_1718880190832",
      ),
      SubcategoryDm(
        name: "Tea, Coffee & Milk Drinks",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Tea,_Coffee_&_Health_Dr_1701251649048",
      ),
      SubcategoryDm(
        name: "Ice creams & More",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Ice_cream_1708404331603",
      ),
      SubcategoryDm(
        name: "Instant Food & Soups",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Instant_&_Frozen_Food_1708339476070",
      ),
      SubcategoryDm(
        name: "Pharma & Wellness",
        imageUrl:
            "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/287_1684822344371.png",
      ),
    ],
  ),
  CategoryDm(
    id: "104",
    name: "Household Essentials",
    subcategories: [
      SubcategoryDm(
        name: "Bath & Bodywash",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Bath_&_Body_(1)_1708404847656",
      ),
      SubcategoryDm(
        name: "Pet Food & Toys",
        imageUrl:
            "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/5_1686741293107.png",
      ),
      SubcategoryDm(
        name: "Home & Office",
        imageUrl:
            "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/1379_1670927201924.png",
      ),
      SubcategoryDm(
        name: "Cleaners & Repellents",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Cleaning_&_repellants-3_1711101861022",
      ),
      SubcategoryDm(
        name: "Stationery & Games",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Stationery_&_Games_(1)_1708407891607",
      ),
      SubcategoryDm(
        name: "Home & Lifestyle",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Home_&_Lifestyle_(5)_1710413986612",
      ),
      SubcategoryDm(
        name: "Batteries & Electricals",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Electronics_(1)_1708404702104",
      ),
      SubcategoryDm(
        name: "Fashion & Accessories",
        imageUrl:
            "https://cdn.grofers.com/app/images/category/cms_images/488a424a-82dc-4bb1-9100-669a7a6552bb.",
      ),
    ],
  ),
  CategoryDm(
    id: "102",
    name: "Care & Wellness",
    subcategories: [
      SubcategoryDm(
        name: "Baby Care",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Baby_care_(1)_1708404895187",
      ),
      SubcategoryDm(
        name: "Skin & Face",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_L0_icons_1710420132949",
      ),
      SubcategoryDm(
        name: "Personal Care",
        imageUrl:
            "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/163_1698986628342.png",
      ),
      SubcategoryDm(
        name: "Hair",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Hair_(1)_1708404557394",
      ),
      SubcategoryDm(
        name: "Organic & Premium",
        imageUrl:
            "https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=70,metadata=none,w=450/app/images/category/cms_images/icon/175_1670926891460.png",
        // "https://cdn.grofers.com/app/images/collections/asset_Sexual_wellness_(1)_1708404220004",
      ),
      SubcategoryDm(
        name: "Beauty & Cosmetics",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Beauty_&_cosmetics_1_1714732458108",
      ),
      SubcategoryDm(
        name: "Feminine Hygiene",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Feminine_hygiene_(1)_1708404632043",
      ),
      SubcategoryDm(
        name: "Health & Pharma",
        imageUrl:
            "https://cdn.grofers.com/app/images/collections/asset_Health_&_pharma_1701253223638",
      ),
    ],
  ),
];
