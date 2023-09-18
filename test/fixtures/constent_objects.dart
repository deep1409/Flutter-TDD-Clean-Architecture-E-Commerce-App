import 'package:eshop/data/models/cart/cart_item_model.dart';
import 'package:eshop/data/models/category/category_model.dart';
import 'package:eshop/data/models/order/order_model.dart';
import 'package:eshop/data/models/product/price_tag_model.dart';
import 'package:eshop/data/models/product/product_model.dart';
import 'package:eshop/data/models/user/delivery_info_model.dart';
import 'package:eshop/data/models/user/user_model.dart';

//products
final tProductModel = ProductModel(
  id: "1",
  name: "name",
  description: "description",
  priceTags: [PriceTagModel(id: "1", name: "name", price: 100)],
  categories: [CategoryModel(id: "1", name: "name", image: "image")],
  images: const ["image"],
  createdAt: DateTime(2000),
  updatedAt: DateTime(2000),
);

final tProductModelList = [tProductModel, tProductModel];
final tProductModelListFuture =
    Future<List<ProductModel>>.value([tProductModel, tProductModel]);

//price tag
final tPriceTagModel = PriceTagModel(id: "1", name: "name", price: 100);

//cart
final tCartItemModel = CartItemModel(
  id: "1",
  product: tProductModel,
  priceTag: tPriceTagModel,
);

//category
final tCategoryModel = CategoryModel(
  id: "1",
  name: "name",
  image: "image",
);

//delivery info
// const tDeliveryInfoModel = DeliveryInfoModel(
//   id: "1",
//   receiver: "receiver",
//   addressLineOne: "addressLineOne",
//   addressLineTwo: "addressLineTwo",
// );

//order
// final tOrderModel = OrderModel(
//   id: '1',
//   products: [tProductModel],
//   deliveryInfo: tDeliveryInfoModel,
// );

//user
const tUserModel = UserModel(
  id: '1',
  firstName: 'Text',
  lastName: 'Text',
  email: 'text@gmail.com',
);
