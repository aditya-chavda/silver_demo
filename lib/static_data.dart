import 'models/category.dart';

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
          imageUrl: "https://example.com/fresh-fruits.jpg"),
      SubcategoryDm(
          name: "Atta, Rice & Dal",
          imageUrl: "https://example.com/fresh-vegetables.jpg"),
      SubcategoryDm(
          name: "Oil, Ghee & Masala",
          imageUrl: "https://example.com/exotic-fruits.jpg"),
      SubcategoryDm(
          name: "Dairy, Bread & Eggs",
          imageUrl: "https://example.com/exotic-vegetables.jpg"),
      SubcategoryDm(
          name: "Bakery & Biscuits",
          imageUrl: "https://example.com/organic-fruits.jpg"),
      SubcategoryDm(
          name: "Dry Fruits & Cereals",
          imageUrl: "https://example.com/organic-vegetables.jpg"),
      SubcategoryDm(
          name: "Kitchenware & Appliances",
          imageUrl: "https://example"
              ".com/cut-peeled"
              ".jpg"),
      SubcategoryDm(
          name: "Herbs & Seasoning",
          imageUrl: "https://example.com/herbs-seasoning.jpg"),
    ],
  ),
  CategoryDm(
    id: "103",
    name: "Snacks & Drinks",
    subcategories: [
      SubcategoryDm(
          name: "Chips & Namkeen", imageUrl: "https://example.com/chips.jpg"),
      SubcategoryDm(
          name: "Biscuits & Cookies",
          imageUrl: "https://example.com/biscuits.jpg"),
      SubcategoryDm(
          name: "Chocolates & Sweets",
          imageUrl: "https://example.com/chocolates.jpg"),
      SubcategoryDm(
          name: "Drinks & Juices", imageUrl: "https://example.com/juices.jpg"),
      SubcategoryDm(
          name: "Tea, Coffee & Milk Drinks",
          imageUrl: "https://example"
              ".com/tea-coffee.jpg"),
      SubcategoryDm(
          name: "Ice creams & More",
          imageUrl: "https://example.com/energy-drinks.jpg"),
      SubcategoryDm(
          name: "Instant Food & Soups",
          imageUrl: "https://example.com/noodles.jpg"),
      SubcategoryDm(
          name: "Dry Fruits & Nuts",
          imageUrl: "https://example.com/dry-fruits.jpg"),
    ],
  ),
  CategoryDm(
    id: "104",
    name: "Household Essentials",
    subcategories: [
      SubcategoryDm(
          name: "Detergents & Dishwash",
          imageUrl: "https://example.com/detergents.jpg"),
      SubcategoryDm(
          name: "Room & Car Fresheners",
          imageUrl: "https://example.com/cleaning-supplies.jpg"),
      SubcategoryDm(
          name: "Paper & Disposables",
          imageUrl: "https://example.com/paper.jpg"),
      SubcategoryDm(
          name: "Cleaners & Repellents",
          imageUrl: "https://example.com/air-fresheners.jpg"),
      SubcategoryDm(
          name: "Stationery & Games",
          imageUrl: "https://example.com/storage"
              ".jpg"),
      SubcategoryDm(
          name: "Home & Lifestyle", imageUrl: "https://example.com/pooja.jpg"),
      SubcategoryDm(
          name: "Batteries & Electricals",
          imageUrl: "https://example.com/batteries.jpg"),
      SubcategoryDm(
          name: "Kitchen Essentials",
          imageUrl: "https://example.com/kitchen.jpg"),
    ],
  ),
  CategoryDm(
    id: "102",
    name: "Dairy & Milk",
    subcategories: [
      SubcategoryDm(name: "Milk", imageUrl: "https://example.com/milk.jpg"),
      SubcategoryDm(name: "Cheese", imageUrl: "https://example.com/cheese.jpg"),
      SubcategoryDm(name: "Butter", imageUrl: "https://example.com/butter.jpg"),
      SubcategoryDm(
          name: "Yogurt & Curd", imageUrl: "https://example.com/yogurt.jpg"),
      SubcategoryDm(
          name: "Paneer & Soya Chunks",
          imageUrl: "https://example.com/paneer"
              ".jpg"),
      SubcategoryDm(
          name: "Breads & Buns", imageUrl: "https://example.com/bread.jpg"),
      SubcategoryDm(
          name: "Cakes & Pastries", imageUrl: "https://example.com/cakes.jpg"),
      SubcategoryDm(
          name: "Cookies & Rusk", imageUrl: "https://example.com/cookies.jpg"),
    ],
  ),
];
